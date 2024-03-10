package annotations.processors;

import com.squareup.javapoet.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.processing.*;
import javax.lang.model.SourceVersion;
import javax.lang.model.element.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
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

        try {
            ProcessorHelper.deleteAppConfigurationFile();
        } catch (IOException e) {
            e.printStackTrace();
        }

        this.startMethod = MethodSpec
                .methodBuilder("start")
                .addModifiers(Modifier.PUBLIC)
                .addCode("logger.info(\"Composant \" + this.getClass().getName() + \" démarré.\");")
                .build();

        this.stopMethod = MethodSpec
                .methodBuilder("stop")
                .addModifiers(Modifier.PUBLIC)
                .addCode("logger.info(\"Composant \" + this.getClass().getName() + \" arrêté.\");")
                .build();

        this.loggerField = FieldSpec
                .builder(Logger.class, "logger")
                .addModifiers(Modifier.PRIVATE, Modifier.FINAL)
                .initializer("org.slf4j.LoggerFactory.getLogger(this.getClass())")
                .build();
    }

    @Override
    public boolean process(Set<? extends TypeElement> annotations, RoundEnvironment roundEnv) {
        for (TypeElement annotation : annotations) {
            for (Element element : roundEnv.getElementsAnnotatedWith(annotation)) {
                TypeElement parentClass = (TypeElement) element;

                // Création d'un sous-composant
                TypeSpec.Builder subComponentBuilder = TypeSpec
                        .classBuilder(ClassName.bestGuess(element.toString() + "_Component"))
                        .superclass(element.asType())
                        .addSuperinterface(ClassName.get("org.picocontainer", "Startable"))
                        .addField(this.loggerField)
                        .addModifiers(Modifier.PUBLIC)
                        .addMethod(this.startMethod)
                        .addMethod(this.stopMethod);

                ProcessorHelper.generateConstructor(parentClass, subComponentBuilder);

                // Final build with all methods and constructors.
                TypeSpec subComponent = subComponentBuilder.build();

                // Save & generate file in target
                ProcessorHelper.saveFile(element, subComponent, this.processingEnv);

                // get annotation infos if there are any
                Map<String, Object> annotationInfos = new HashMap<>();
                for (AnnotationMirror annotationMirror : element.getAnnotationMirrors()) {
                    for (Map.Entry<? extends ExecutableElement, ? extends AnnotationValue> entry : annotationMirror.getElementValues().entrySet()) {
                        annotationInfos.put(entry.getKey().getSimpleName().toString(), entry.getValue().getValue());
                    }
                }

                // Add new line to the appConfiguration.json file
                ProcessorHelper.addNewLineToAppConfiguration(element.toString(), annotationInfos);
            }
        }
        return true;
    }
}
