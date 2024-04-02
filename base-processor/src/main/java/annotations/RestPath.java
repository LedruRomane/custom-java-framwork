package annotations;

import java.lang.annotation.*;

@Target(ElementType.TYPE)

@Retention(RetentionPolicy.RUNTIME)

@Inherited

/**
 * GetPath for server
 */
public @interface RestPath {
    String path() default "";
}
