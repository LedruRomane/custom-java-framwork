package annotations;

import java.lang.annotation.*;

@Target(ElementType.TYPE)

@Retention(RetentionPolicy.SOURCE)


/**
 * Annotation qui permettra de définir déclarativement les composants du framework
 */
public @interface Persistence {
    String dbhost() default "";
    String dbname() default "";
    String dbuser() default "";
    String dbpassword() default "";
}
