package annotations;

import annotations.params.METHOD_REST;

import java.lang.annotation.*;

@Target(ElementType.TYPE)

@Retention(RetentionPolicy.SOURCE)


/**
 * Annotation qui permettra de définir déclarativement les composants du framework
 */
public @interface ServletFromHandler {
    METHOD_REST method() default METHOD_REST.GET;
    String path() default "";
    String[] params() default {};
}
