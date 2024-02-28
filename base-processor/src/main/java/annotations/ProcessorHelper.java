package annotations;

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
        // Add constructor(s)
        for (Element enclosedElement : parentClass.getEnclosedElements()) {
            if (enclosedElement.getKind() == ElementKind.CONSTRUCTOR) {
                List<ParameterSpec> parameters = new ArrayList<>();

                // Create a string builder to hold the super() call
                StringBuilder superStatement = new StringBuilder("super(");

                // Get the parameters from the current constructor
                int index = 0;
                for (VariableElement parameter : ((ExecutableElement) enclosedElement).getParameters()) {
                    // Add the parameter to the list of parameters
                    parameters.add(ParameterSpec.builder(TypeName.get(parameter.asType()), parameter.getSimpleName().toString()).build());

                    // Add the parameter to the super() call
                    superStatement.append(parameter.getSimpleName());

                    // Add a comma if this is not the last parameter
                    if (index < ((ExecutableElement) enclosedElement).getParameters().size() - 1) {
                        superStatement.append(", ");
                    }

                    index++;
                }

                // Close the super() call
                superStatement.append(")");

                // Create the new constructor
                MethodSpec newConstructor = MethodSpec.constructorBuilder()
                        .addModifiers(Modifier.PUBLIC)
                        .addParameters(parameters)
                        .addStatement(superStatement.toString())
                        .build();

                // Add the new constructor to the subclass
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
        // switch element type (get from the last _example in element string)
        String type = element.substring(element.lastIndexOf("_") + 1);
        switch (type) {
            case "Data":
                addClassicComponent(element, mapper, "data-components");
                break;
            case "Dispatcher":
                addClassicComponent(element, mapper, "dispatcher-components");
                break;
            case "Handler":
                addHandlerComponent(element, mapper, "handlers-components");
                break;
            case "Persistence":
                addPersistentComponent(element, mapper, annotationInfos);
                break;
            default:
                addClassicComponent(element, mapper, "components");
                break;
        }
    }

    public static void addClassicComponent(String element, ObjectMapper mapper, String namespace) {
        try {
            JsonNode appConfiguration = getOrCreateAppConfiguration();
            JsonNode appConfig = appConfiguration.get("application-config");
            ObjectNode newNode = mapper.createObjectNode();
            newNode.put("class-name", element.toString() + "_Component");

            if (appConfig.has(namespace)) {
                ((ArrayNode) appConfig.get(namespace)).add(newNode);
            } else {
                ((ObjectNode) appConfiguration.get("application-config")).putArray(namespace).add(newNode);
            }

            // Write the modified appConfiguration back to the file
            mapper.writeValue(new File(path), appConfiguration);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void addHandlerComponent(String element, ObjectMapper mapper, String namespace) {
        try {
            JsonNode appConfiguration = getOrCreateAppConfiguration();
            JsonNode appConfig = appConfiguration.get("application-config");

            if (appConfig.has(namespace)) {
                JsonNode handlersComponents = appConfig.get(namespace);
                ArrayNode handlersComponentsArray = (ArrayNode) handlersComponents;
                JsonNode handlersNode = handlersComponentsArray.get(0);

                ((ArrayNode) handlersNode.get("arguments")).add(
                        mapper.createObjectNode().put("class-name", element + "_Component")
                );
            } else {
                ObjectNode newNode = mapper.createObjectNode();
                newNode.put("type", "handler-locator");
                ArrayNode arguments = newNode.putArray("arguments");
                arguments.add(mapper.createObjectNode().put("class-name", element + "_Component"));
                ((ObjectNode) appConfiguration.get("application-config")).putArray(namespace).add(newNode);
            }

            // Write the modified appConfiguration.json file back to the disk
            mapper.writeValue(new File(path), appConfiguration);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public static void addPersistentComponent(String element, ObjectMapper mapper, Map annotationInfos) {
        // extract annotation infos
        String dbhost = (String) annotationInfos.get("dbhost");
        String dbname = (String) annotationInfos.get("dbname");
        String dbuser = (String) annotationInfos.get("dbuser");
        String dbpassword = (String) annotationInfos.get("dbpassword");

        try {
            JsonNode appConfiguration = getOrCreateAppConfiguration();
            JsonNode appConfig = appConfiguration.get("application-config");

            if (appConfig.has("persistence-components")) {
                // don't add a persistence component if it already exists.
                return;
            } else {
                ObjectNode componentNode = mapper.createObjectNode();
                ObjectNode entityManagerNode = mapper.createObjectNode();
                ObjectNode factoryNode = mapper.createObjectNode();
                ArrayNode params = mapper.createArrayNode();

                params.add(mapper.createObjectNode().put("name", "DB_HOST").put("value", dbhost));
                params.add(mapper.createObjectNode().put("name", "DB_NAME").put("value", dbname));
                params.add(mapper.createObjectNode().put("name", "DB_USER").put("value", dbuser));
                params.add(mapper.createObjectNode().put("name", "DB_PASSWORD").put("value", dbpassword));

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
           }
            // Write the modified appConfiguration.json file back to the disk
            mapper.writeValue(new File(path), appConfiguration);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
