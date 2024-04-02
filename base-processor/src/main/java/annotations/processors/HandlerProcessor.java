package annotations.processors;

import annotations.params.COMPONENT_TYPE;
import annotations.Component;
import com.squareup.javapoet.*;

import javax.annotation.processing.AbstractProcessor;
import javax.annotation.processing.RoundEnvironment;
import javax.annotation.processing.SupportedAnnotationTypes;
import javax.annotation.processing.SupportedSourceVersion;
import javax.lang.model.SourceVersion;
import javax.lang.model.element.*;
import java.util.Set;

@SupportedAnnotationTypes("annotations.Handler")
@SupportedSourceVersion(SourceVersion.RELEASE_21)
public class HandlerProcessor extends AbstractProcessor {

    public boolean process(Set<? extends TypeElement> annotations, RoundEnvironment roundEnv) {
        for (TypeElement annotation : annotations) {
            for (Element element : roundEnv.getElementsAnnotatedWith(annotation)) {
                TypeElement parentClass = (TypeElement) element;
                AnnotationSpec annotationSpec = AnnotationSpec.builder(Component.class).addMember(
                        "type", "$T.$L", COMPONENT_TYPE.class, COMPONENT_TYPE.HANDLER.name()
                        ).build();

                TypeSpec.Builder subComponentBuilder = TypeSpec
                        .classBuilder(ClassName.bestGuess(element.toString() + "_Handler"))
                        .superclass(element.asType())
                        .addModifiers(Modifier.PUBLIC)
                        .addAnnotation(annotationSpec);

                ProcessorHelper.generateConstructor(parentClass, subComponentBuilder);

                TypeSpec subComponent = subComponentBuilder.build();

                ProcessorHelper.saveFile(element, subComponent, processingEnv);
            }
        }
        return true;
    }

}
