package annotations.processors;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.squareup.javapoet.*;

import javax.annotation.processing.Filer;
import javax.annotation.processing.ProcessingEnvironment;
import javax.lang.model.element.*;
import javax.tools.JavaFileObject;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ProcessorHelper {
    public static String path = "src/main/resources/appConfiguration.json";

    static void generateConstructor(TypeElement parentClass, TypeSpec.Builder subComponentBuilder) {
        for (Element enclosedElement : parentClass.getEnclosedElements()) {
            if (enclosedElement.getKind() == ElementKind.CONSTRUCTOR) {
                List<ParameterSpec> parameters = new ArrayList<>();

                StringBuilder superStatement = new StringBuilder("super(");
                int index = 0;
                for (VariableElement parameter : ((ExecutableElement) enclosedElement).getParameters()) {
                    parameters.add(ParameterSpec.builder(TypeName.get(parameter.asType()), parameter.getSimpleName().toString()).build());
                    superStatement.append(parameter.getSimpleName());

                    if (index < ((ExecutableElement) enclosedElement).getParameters().size() - 1) {
                        superStatement.append(", ");
                    }

                    index++;
                }

                // Close the super() call
                superStatement.append(")");

                MethodSpec newConstructor = MethodSpec.constructorBuilder()
                        .addModifiers(Modifier.PUBLIC)
                        .addParameters(parameters)
                        .addStatement(superStatement.toString())
                        .build();

                subComponentBuilder.addMethod(newConstructor);
            }
        }
    }

    static void saveFile(Element element, TypeSpec subComponent, ProcessingEnvironment processingEnv) {
        PackageElement packageElement = processingEnv.getElementUtils().getPackageOf(element);
        String packageName = packageElement.getQualifiedName().toString();

        // Création du fichier source Java
        JavaFile javaFile = JavaFile
                .builder(packageName, subComponent)
                .build();
        try {
            // Utilisation de l'interface Filer pour récupérer un PrintWriter
            // vers le répertoire GeneratedSources indiqué dans le pom
            JavaFileObject builderFile = processingEnv
                    .getFiler()
                    .createSourceFile(subComponent.name);
            try (PrintWriter out = new PrintWriter(builderFile.openWriter())) {
                // Ecriture du fichier
                javaFile.writeTo(out);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void deleteAppConfigurationFile() throws IOException {
        File file = new File(path);
        if (Files.exists(Paths.get(file.getPath()))) {
            Files.delete(Paths.get(file.getPath()));
        }
    }

    public static JsonNode getOrCreateAppConfiguration() throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        File file = new File(path);

        if (Files.exists(Paths.get(file.getPath()))) {
            // If the file exists, read it and return a JsonNode
            return mapper.readTree(file);
        } else {
            // If the file does not exist, create a new JsonNode with the provided structure, write it to the file, and return it
            String initialJson = "{\n" +
                    "  \"application-config\": {\n" +
                    "  }\n" +
                    "}";
            JsonNode rootNode = mapper.readTree(initialJson);
            mapper.writeValue(file, rootNode);
            return rootNode;
        }
    }

    public static void addNewLineToAppConfiguration(String element, Map annotationInfos) {

        ObjectMapper mapper = new ObjectMapper();
        // switch which ANNOTATION it is.
        String type = element.substring(element.lastIndexOf("_") + 1);
        switch (type) {
            case "Data":
                addComponent(element, mapper, "data-components", "default", null, null);
                break;
            case "Dispatcher":
                addComponent(element, mapper, "dispatcher-components", "default", null, null);
                break;
            case "Handler":
                addComponent(element, mapper, "handlers-components", "handler", "handler-locator", null);
                break;
            case "Persistence":
                addComponent(element, mapper, "persistence-components", "persistence", null, annotationInfos);
                break;
            case "Servlet":
                addComponent(element, mapper, "servlets-components", "servlet", "servlet-set", null);
                break;
            default:
                addComponent(element, mapper, "components", "default", null, null);
                break;
        }
    }

    public static void addComponent(String element, ObjectMapper mapper, String namespace, String type, String elementName, Map annotationInfos) {
        try {
            JsonNode appConfiguration = getOrCreateAppConfiguration();
            JsonNode appConfig = appConfiguration.get("application-config");
            ObjectNode newNode = mapper.createObjectNode();
            newNode.put("class-name", element + "_Component");

            if (appConfig.has(namespace)) {
                switch (type) {
                    case "servlet", "handler" :
                        JsonNode servletsComponents = appConfig.get(namespace);
                        ArrayNode servletsComponentsArray = (ArrayNode) servletsComponents;
                        JsonNode servletsNode = servletsComponentsArray.get(0);

                        ((ArrayNode) servletsNode.get("arguments")).add(newNode);
                        break;
                    case "persistence":
                        return;
                    default:
                        ((ArrayNode) appConfig.get(namespace)).add(newNode);
                }
            } else {
                switch (type) {
                    case "servlet", "handler" :
                        ObjectNode typeNode = mapper.createObjectNode();
                        typeNode.put("type", elementName);
                        ArrayNode arguments = typeNode.putArray("arguments");
                        arguments.add(newNode);
                        ((ObjectNode) appConfiguration.get("application-config")).putArray(namespace).add(typeNode);
                        break;
                    case "persistence":
                        ObjectNode componentNode = mapper.createObjectNode();
                        ObjectNode entityManagerNode = mapper.createObjectNode();
                        ObjectNode factoryNode = mapper.createObjectNode();
                        ArrayNode params = mapper.createArrayNode();

                        params.add(mapper.createObjectNode().put("name", "DB_HOST").put("value", (String) annotationInfos.get("dbhost")));
                        params.add(mapper.createObjectNode().put("name", "DB_NAME").put("value", (String) annotationInfos.get("dbname")));
                        params.add(mapper.createObjectNode().put("name", "DB_USER").put("value", (String) annotationInfos.get("dbuser")));
                        params.add(mapper.createObjectNode().put("name", "DB_PASSWORD").put("value", (String) annotationInfos.get("dbpassword")));

                        componentNode.put("class-name", element + "_Component");
                        componentNode.put("params", params);

                        entityManagerNode.put("class-name", "jakarta.persistence.EntityManagerFactory");
                        entityManagerNode.put("factory-type", element + "_Component");
                        entityManagerNode.put("factory-method", "createEntityManagerFactory");

                        factoryNode.put("class-name", "jakarta.persistence.EntityManager");
                        factoryNode.put("factory-type", "jakarta.persistence.EntityManagerFactory");
                        factoryNode.put("factory-method","createEntityManager");

                        ((ObjectNode) appConfiguration.get("application-config")).putArray("persistence-components");
                        ((ArrayNode) appConfig.get("persistence-components")).add(componentNode);
                        ((ArrayNode) appConfig.get("persistence-components")).add(entityManagerNode);
                        ((ArrayNode) appConfig.get("persistence-components")).add(factoryNode);
                        break;
                    default:
                        ((ObjectNode) appConfiguration.get("application-config")).putArray(namespace).add(newNode);
                }
            }

            // Write the modified appConfiguration back to the file
            mapper.writeValue(new File(path), appConfiguration);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
