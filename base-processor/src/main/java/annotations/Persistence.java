package annotations;

import java.lang.annotation.*;

// S'applique aux classes, interfaces et enums
@Target(ElementType.TYPE)

// Sera traitée par un annotation processor à l'exécution
@Retention(RetentionPolicy.RUNTIME)

// S'applique aussi aux sous-classes de celles annotées
//@Inherited

/**
 * Annotation qui permettra de définir déclarativement les composants du framework
 */
public @interface Persistence {
    String dbhost() default "";
    String dbname() default "";
    String dbuser() default "";
    String dbpassword() default "";
}
