package annotations;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.squareup.javapoet.AnnotationSpec;
import com.squareup.javapoet.ClassName;
import com.squareup.javapoet.TypeSpec;

import javax.annotation.processing.AbstractProcessor;
import javax.annotation.processing.RoundEnvironment;
import javax.annotation.processing.SupportedAnnotationTypes;
import javax.annotation.processing.SupportedSourceVersion;
import javax.lang.model.SourceVersion;
import javax.lang.model.element.Element;
import javax.lang.model.element.Modifier;
import javax.lang.model.element.TypeElement;
import java.io.File;
import java.io.IOException;
import java.util.Set;

@SupportedAnnotationTypes("annotations.Data")
@SupportedSourceVersion(SourceVersion.RELEASE_21)
public class DataProcessor extends AbstractProcessor {

    public boolean process(Set<? extends TypeElement> annotations, RoundEnvironment roundEnv) {
        for (TypeElement annotation : annotations) {
            for (Element element : roundEnv.getElementsAnnotatedWith(annotation)) {
                TypeElement parentClass = (TypeElement) element;
                AnnotationSpec annotationSpec = AnnotationSpec.builder(Component.class).addMember(
                        "type", "$T.$L", COMPONENT_TYPE.class, COMPONENT_TYPE.DATA.name()
                        ).build();

                TypeSpec.Builder subComponentBuilder = TypeSpec
                        .classBuilder(ClassName.bestGuess(element.toString() + "_Data"))
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
