package annotations;

import com.squareup.javapoet.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.processing.*;
import javax.lang.model.SourceVersion;
import javax.lang.model.element.*;
import javax.tools.JavaFileObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Constructor;
import java.lang.reflect.Parameter;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@SupportedAnnotationTypes("annotations.Component")
@SupportedSourceVersion(SourceVersion.RELEASE_21)
public class BaseProcessor extends AbstractProcessor {
    private static final Logger logger = LoggerFactory.getLogger(AbstractProcessor.class);
    MethodSpec startMethod;
    MethodSpec stopMethod;
    FieldSpec loggerField;

    @Override
    public synchronized void init(ProcessingEnvironment processingEnv) {
        super.init(processingEnv);
        this.startMethod = MethodSpec
                .methodBuilder("start")
                .addModifiers(Modifier.PUBLIC)
                .addCode("logger.info(\"Composant \" + this.toString() + \" démarré.\");")
                .build();

        this.stopMethod = MethodSpec
                .methodBuilder("stop")
                .addModifiers(Modifier.PUBLIC)
                .addCode("logger.info(\"Composant \" + this.toString() + \" arrêté.\");")
                .build();

        this.loggerField = FieldSpec
                .builder(Logger.class, "logger")
                .addModifiers(Modifier.PRIVATE, Modifier.FINAL)
                .initializer("org.slf4j.LoggerFactory.getLogger(this.getClass())")
                .build();
    }

    public boolean process(Set<? extends TypeElement> annotations, RoundEnvironment roundEnv) {
        for (TypeElement annotation : annotations) {
            logger.info("Annotation : " + annotation.getSimpleName());
            for (Element element : roundEnv.getElementsAnnotatedWith(annotation)) {
                logger.info("Element annote : " + element.toString());
                TypeElement parentClass = (TypeElement) element;

                // Création d'un sous-composant
                TypeSpec.Builder subComponentBuilder = TypeSpec
                        .classBuilder(ClassName.bestGuess(element.toString() + "_Component"))
                        .superclass(element.asType())
                        .addField(this.loggerField)
                        .addModifiers(Modifier.PUBLIC)
                        .addMethod(this.startMethod)
                        .addMethod(this.stopMethod)
                        .addField(String.class, "name", Modifier.PRIVATE) // Ajout d'un champ 'name'
                        .addMethod(MethodSpec.methodBuilder("getName") // Ajout d'une méthode 'getName()'
                                .addModifiers(Modifier.PUBLIC)
                                .returns(String.class)
                                .addStatement("return this.name")
                                .build());

                // Add constructor(s) (wink wink)
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

                // Final build with all methods and constructors.
                TypeSpec subComponent = subComponentBuilder.build();

                String packageName = element.toString();
                int separator = packageName.lastIndexOf(".");
                packageName = packageName.substring(0, separator);
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
        return true;
    }
}
