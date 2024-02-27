package annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

// S'applique aux classes, interfaces et enums
@Target(ElementType.TYPE)

// Sera traitée par un annotation processor au niveau des sources (pas sur les fichiers compilés ni à l'exécution)
@Retention(RetentionPolicy.SOURCE)

// S'applique aussi aux sous-classes de celles annotées
// @Inherited

/**
 * Annotation qui permettra de définir déclarativement les composants du framework
 */
public @interface Handler {
}
