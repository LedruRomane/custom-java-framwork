package annotations.processors;

import annotations.Component;
import annotations.RestPath;
import annotations.ServletFromHandler;
import annotations.params.COMPONENT_TYPE;
import annotations.params.METHOD_REST;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.squareup.javapoet.*;

import javax.annotation.processing.AbstractProcessor;
import javax.annotation.processing.RoundEnvironment;
import javax.annotation.processing.SupportedAnnotationTypes;
import javax.annotation.processing.SupportedSourceVersion;
import javax.lang.model.SourceVersion;
import javax.lang.model.element.Element;
import javax.lang.model.element.ExecutableElement;
import javax.lang.model.element.Modifier;
import javax.lang.model.element.TypeElement;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@SupportedAnnotationTypes("annotations.ServletFromHandler")
@SupportedSourceVersion(SourceVersion.RELEASE_21)
public class ServletProcessor extends AbstractProcessor {

    public boolean process(Set<? extends TypeElement> annotations, RoundEnvironment roundEnv) {
        for (TypeElement annotation : annotations) {
            for (Element element : roundEnv.getElementsAnnotatedWith(annotation)) {

                // Component annotation
                AnnotationSpec annotationSpec = AnnotationSpec.builder(Component.class).addMember(
                        "type", "$T.$L", COMPONENT_TYPE.class, COMPONENT_TYPE.SERVLET.name()
                ).build();

                // Get info from the ServletFromHandler annotation
                METHOD_REST method = element.getAnnotation(ServletFromHandler.class).method();
                String path = element.getAnnotation(ServletFromHandler.class).path();
                String[] params = element.getAnnotation(ServletFromHandler.class).params();

                AnnotationSpec servletAnnotation = AnnotationSpec.builder(RestPath.class)
                        .addMember("path", "$S", path)
                        .build();

                // Init builder for the servlet main method : doGet, doPost, doDelete, etc.
                MethodSpec.Builder doMethod = MethodSpec.methodBuilder("do" + method.getName())
                        .addAnnotation(Override.class)
                        .addModifiers(Modifier.PUBLIC)
                        .addParameter(ClassName.get("jakarta.servlet.http", "HttpServletRequest"), "req")
                        .addParameter(ClassName.get("jakarta.servlet.http", "HttpServletResponse"), "resp")
                        .addException(ClassName.get("java.io", "IOException"))
                        .addStatement("resp.setContentType(\"application/json\")")
                        .addStatement("$T<String, Object> map = new $T<>()", Map.class, HashMap.class);

                // Init builder for the servlet class
                TypeSpec.Builder servletBuilder = TypeSpec
                        .classBuilder(ClassName.bestGuess(element.toString() + "_Servlet"))
                        .superclass(ClassName.get("jakarta.servlet.http", "HttpServlet"))
                        .addModifiers(javax.lang.model.element.Modifier.PUBLIC)
                        .addAnnotation(annotationSpec)
                        .addAnnotation(servletAnnotation);


                // Init function (servletConfig)
                MethodSpec initMethod = MethodSpec.methodBuilder("init")
                        .addAnnotation(Override.class)
                        .addModifiers(Modifier.PUBLIC)
                        .addParameter(ClassName.get("jakarta.servlet", "ServletConfig"), "config")
                        .addException(ClassName.get("jakarta.servlet", "ServletException"))
                        .addStatement("super.init(config)")
                        .build();


                // GET Method
                if (params.length > 0 && (method.equals(METHOD_REST.GET) || method.equals(METHOD_REST.DELETE))) {
                    MethodSpec.Builder getParamsBuilder = MethodSpec.methodBuilder("getParams")
                            .addModifiers(Modifier.PRIVATE)
                            .addParameter(ClassName.get("jakarta.servlet.http", "HttpServletRequest"), "req")
                            .returns(ParameterizedTypeName.get(
                                    ClassName.get("java.util", "Map"),
                                    ClassName.get("java.lang", "String"),
                                    ClassName.get("java.lang", "Object")));

                    for (String param : params) {
                        getParamsBuilder.addStatement("$T $L = req.getParameter($S)", String.class, param, param);
                    }

                    getParamsBuilder.addStatement("return $T.of($L)", Map.class, String.join(", ", Arrays.stream(params).flatMap(p -> Stream.of("\"" + p + "\"", p)).collect(Collectors.joining(", "))));

                    MethodSpec getParams = getParamsBuilder.build();
                    servletBuilder.addMethod(getParams);

                    doMethod.addStatement("map = getParams(req)", ClassName.get("java.util", "Map"));
                }

                // POST Method (we need to get params from the body)
                if (method.equals(METHOD_REST.POST)) {
                    doMethod.addStatement("map = new $T().readValue(req.getReader(), $T.class)", ObjectMapper.class, Map.class);
                }

                // mapToCommand, return Command object (java reflexion to get the right one).
                try {
                    Optional<ExecutableElement> optionalHandle = element.getEnclosedElements().stream()
                            .filter(e -> e.toString().contains("handle"))
                            .map(e -> (ExecutableElement) e)
                            .findFirst();
                    if (optionalHandle.isEmpty()) {
                        throw new NoSuchMethodException("No method handle found");
                    } else {
                        String command = optionalHandle.get().getParameters().getFirst().asType().toString();

                        MethodSpec.Builder mapToCommandBuilder = MethodSpec.methodBuilder("mapToCommand")
                                .addModifiers(Modifier.PRIVATE)
                                .addParameter(ParameterizedTypeName.get(
                                        ClassName.get("java.util", "Map"),
                                        ClassName.get("java.lang", "String"),
                                        ClassName.get("java.lang", "Object")), "params")
                                .returns(ClassName.bestGuess(command));

                        mapToCommandBuilder.addStatement("$T mapper = new $T()", ClassName.get("com.fasterxml.jackson.databind", "ObjectMapper"), ClassName.get("com.fasterxml.jackson.databind", "ObjectMapper"));
                        mapToCommandBuilder.addStatement("return mapper.convertValue(params, $T.class)", ClassName.bestGuess(command));

                        MethodSpec mapToCommand = mapToCommandBuilder.build();


                        // Finish and build the doMethod
                        MethodSpec doMethodBuilt = doMethod.beginControlFlow("try")
                                .addStatement("String response = formatter.serializeObject(this.commandBus.handle(mapToCommand(map)))")
                                .addStatement("resp.getWriter().write(response)")
                                .nextControlFlow("catch ($T e)", Exception.class)
                                .addStatement("resp.sendError(jakarta.servlet.http.HttpServletResponse.SC_BAD_REQUEST, e.getMessage())")
                                .endControlFlow()
                                .build();

                        // Finish and build the servlet class
                        TypeSpec servlet = servletBuilder
                                .addField(ClassName.get("tiw.is.server.commandBus", "CommandBus"), "commandBus", Modifier.PRIVATE, Modifier.FINAL)
                                .addField(FieldSpec.builder(ParameterizedTypeName.get(
                                                        ClassName.get("tiw.is.server.utils", "JsonFormatter"),
                                                        ClassName.bestGuess(command)),
                                                "formatter", Modifier.PRIVATE, Modifier.STATIC, Modifier.FINAL)
                                        .initializer("new JsonFormatter<>()")
                                        .build())
                                .addMethod(MethodSpec.constructorBuilder()
                                        .addModifiers(Modifier.PUBLIC)
                                        .addParameter(ClassName.get("tiw.is.server.commandBus", "CommandBus"), "commandBus")
                                        .addStatement("this.commandBus = commandBus")
                                        .build())
                                .addMethod(initMethod)
                                .addMethod(doMethodBuilt)
                                .addMethod(mapToCommand)
                                .build();

                        // Save the file
                        ProcessorHelper.saveFile(element, servlet, processingEnv);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return true;
    }

}
