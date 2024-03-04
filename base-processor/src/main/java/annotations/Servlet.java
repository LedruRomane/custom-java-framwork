package annotations;

import annotations.params.METHOD_REST;

import java.lang.annotation.*;

@Target(ElementType.TYPE)

@Retention(RetentionPolicy.RUNTIME)

@Inherited


/**
 * Annotation qui permettra de définir déclarativement les composants du framework
 */
public @interface Servlet {
    METHOD_REST method() default METHOD_REST.GET;
    String path() default "";
    String[] params() default {};
}
