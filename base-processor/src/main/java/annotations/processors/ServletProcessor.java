package annotations.processors;

import annotations.Servlet;
import annotations.params.COMPONENT_TYPE;
import annotations.Component;
import annotations.params.METHOD_REST;
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
import javax.lang.model.type.DeclaredType;
import javax.lang.model.type.ExecutableType;
import javax.lang.model.type.TypeMirror;
import javax.lang.model.util.Types;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Set;

@SupportedAnnotationTypes("annotations.Servlet")
@SupportedSourceVersion(SourceVersion.RELEASE_21)
public class ServletProcessor extends AbstractProcessor {

    public boolean process(Set<? extends TypeElement> annotations, RoundEnvironment roundEnv) {
        for (TypeElement annotation : annotations) {
            for (Element element : roundEnv.getElementsAnnotatedWith(annotation)) {
                TypeElement parentClass = (TypeElement) element;

               AnnotationSpec annotationSpec = AnnotationSpec.builder(Component.class).addMember(
                        "type", "$T.$L", COMPONENT_TYPE.class, COMPONENT_TYPE.SERVLET.name()
                ).build();


                METHOD_REST method = element.getAnnotation(Servlet.class).method();
                String path = element.getAnnotation(Servlet.class).path();
                String[] params = element.getAnnotation(Servlet.class).params();
                //1 extraire les params qui sont entre {} dans path.
                //2 générer une fonction qui va prendre en paramètre les params extraits
                //2 process: il va mapper ces params dans un objet json et le return.

                //3 filer ce résultat au contructeur de la command.


                MethodSpec initMethod = MethodSpec.methodBuilder("init")
                        .addAnnotation(Override.class)
                        .addModifiers(Modifier.PUBLIC)
                        .addParameter(ClassName.get("javax.servlet", "ServletConfig"), "config")
                        .addException(ClassName.get("javax.servlet", "ServletException"))
                        .addStatement("super.init(config)")
                        .build();
                try {

                    Types typeUtils = processingEnv.getTypeUtils();

                    ExecutableElement methodElement = (ExecutableElement) element.getEnclosedElements().stream()
                            .filter(e -> e.getSimpleName().toString().equals("handle"))
                            .findFirst()
                            .get();

                    ExecutableType methodType = (ExecutableType) typeUtils.asMemberOf((DeclaredType) parentClass.asType(), methodElement);
                    List<? extends TypeMirror> argTypes = methodType.getParameterTypes();

                    for (TypeMirror argType : argTypes) {
                        String typeName = ((DeclaredType) argType).asElement().toString();
                        try {
                            Class<?> argClass = Class.forName(typeName);
                            Constructor<?> constructor = argClass.getConstructor();

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }


                    Class<?> handlerClass = Class.forName(element.toString());
                    // get command class from params of handlerClass inside handle method
                    Class<?> commandClass = handlerClass.getMethod("handle").getParameters()[0].getType();

                    // invoke constructor of commandClass with httpServletRequest
                    Object command = commandClass.getConstructor().newInstance();

                    // 2- get response with calling handle(command) from current element
                    Method handleMethod = handlerClass.getMethod("handle", command.getClass());
                    Object response = handleMethod.invoke(handlerClass.newInstance(), command);
                } catch (Exception e) {
                    e.printStackTrace();
                }


                MethodSpec methodBuilder = MethodSpec.methodBuilder("do" + method.name())
                        .addAnnotation(Override.class)
                        .addModifiers(Modifier.PUBLIC)
                        .addParameter(ClassName.get("javax.servlet.http", "HttpServletRequest"), "req")
                        .addParameter(ClassName.get("javax.servlet.http", "HttpServletResponse"), "resp")
                        .addException(ClassName.get("javax.servlet", "ServletException"))
                        .addException(ClassName.get("java.io", "IOException"))
                        .build();


                TypeSpec.Builder servletBuilder = TypeSpec
                        .classBuilder(ClassName.bestGuess(element.toString() + "_Servlet"))
                        .superclass(ClassName.get("javax.servlet.http", "HttpServlet"))
                        .addModifiers(javax.lang.model.element.Modifier.PUBLIC)
                        .addAnnotation(annotationSpec)
                        .addMethod(initMethod)
                        .addMethod(methodBuilder);


            }
        }
        return true;
    }

}
