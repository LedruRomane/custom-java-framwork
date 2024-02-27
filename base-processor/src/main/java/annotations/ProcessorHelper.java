package annotations;

import com.squareup.javapoet.*;

import javax.annotation.processing.ProcessingEnvironment;
import javax.lang.model.element.*;
import javax.tools.JavaFileObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

public class ProcessorHelper {

    static void generateContructor(TypeElement parentClass, TypeSpec.Builder subComponentBuilder) {
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
}
