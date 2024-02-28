package annotations;

import com.fasterxml.jackson.databind.JsonNode;
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
import java.io.IOException;
import java.lang.annotation.Annotation;
import java.util.Set;

@SupportedAnnotationTypes("annotations.Persistence")
@SupportedSourceVersion(SourceVersion.RELEASE_21)
public class PersistenceProcessor extends AbstractProcessor {

    public boolean process(Set<? extends TypeElement> annotations, RoundEnvironment roundEnv) {
        for (TypeElement annotation : annotations) {
            for (Element element : roundEnv.getElementsAnnotatedWith(annotation)) {
                if (element.getAnnotation(Component.class) != null) {
                    return true;
                }
            }
        }

        for (TypeElement annotation : annotations) {
            for (Element element : roundEnv.getElementsAnnotatedWith(annotation)) {

                TypeElement parentClass = (TypeElement) element;

                // Add Component annotation to the class
                AnnotationSpec annotationSpecComponent = AnnotationSpec.builder(Component.class)
                        .addMember("type", "$T.$L", COMPONENT_TYPE.class, COMPONENT_TYPE.PERSISTENCE.name())
                        .build();
                // Transfer Persistence annotation
                AnnotationSpec annotationSpecPersistence = AnnotationSpec.builder(Persistence.class)
                        .addMember("dbhost", "$S", element.getAnnotation(Persistence.class).dbhost())
                        .addMember("dbname", "$S", element.getAnnotation(Persistence.class).dbname())
                        .addMember("dbuser", "$S", element.getAnnotation(Persistence.class).dbuser())
                        .addMember("dbpassword", "$S", element.getAnnotation(Persistence.class).dbpassword())
                        .build();

                TypeSpec.Builder subComponentBuilder = TypeSpec
                        .classBuilder(ClassName.bestGuess(element.toString() + "_Persistence"))
                        .superclass(element.asType())
                        .addModifiers(Modifier.PUBLIC)
                        .addAnnotation(annotationSpecComponent)
                        .addAnnotation(annotationSpecPersistence);


                ProcessorHelper.generateConstructor(parentClass, subComponentBuilder);

                TypeSpec subComponent = subComponentBuilder.build();

                ProcessorHelper.saveFile(element, subComponent, processingEnv);
            }
        }
        return true;
    }

}
