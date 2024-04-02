# TP3 & TP4 : Métaprogrammation & Framework web

## Objectifs
1. Génération de code à partir d'annotations.
2. Création d'un framework web.

Tout code de service doit être annoté afin de générer automatiquement le code de configuration nécessaire au bon fonctionnement du framework.

On utilisera pour cela la librairie `javapoet` qui permet de générer du code Java à partir de classes Java.

Annotations à implémenter :
- `@Component` : pour marquer une classe comme composant.
- `@Data` : Pour les classes de données (DTO).
- `@Handler` : Pour les classes de service (cf. Controller pour le TP).
- `@Persistence`: Pour le Persitence Manager.
- `@ServletFromHandler`: Pour générer les servlets à partir des classes de service.

On notera que `@Component` est une annotation ajoutée automatiquement sur les classes
générées avec les autres annotations.
Cela permet d'avoir un seul passage dans le baseProcessor associé à `@Component`. C'est 
aussi ici que l'on modifie le fichier json de configuration.

## Travail réalisé

### Annotations notables
- `@Component`

Elle est ajoutée automatiquement sur les classes générées avec les autres annotations.
Elle a pour but non seulement d'ajouter l'interface Startable, mais aussi de modifier
le fichier de configuration pour y ajouter au bon endroit les informations nécessaires au
bon chargement du service dans PicoContainer.

- `@Persistence`

Cette annotation est particulière car elle permet de préciser des valeurs comme 
le nom de la base de donnée ou l'utilisateur. On utilise ces données pour charger 
correctement le fichier de configuration.

- `@Handler`

Outre le fait de générer une classe de service, l'existence de cette annotation implique
la création d'un handlerLocator qui associe aux Command l'handler associé.
On récupère la Command via de la Java Reflection.

- `@ServletFromHandler`

Cette annotation est un long travail de génération de code. Elle permet
de générer des servlets à partir des classes de service, et ce de façon totalement
transparente du type de service. On y précise donc le path, la méthode, et les paramètres
du body si besoin. 

### Servlet et WebServer

Le WebServer est un serveur web qui utilise des servlets pour répondre aux requêtes.
On doit utiliser les servlets générées pour répondre aux requêtes, et donc
charger les classes de servlets générées dynamiquement dans picocontainer.
On va utiliser le fichier de configuration pour charger les servlets, mais
aussi un ServletSet, qui sera utilisé comme un annuaire pour les servlets (même fonctionnement que le handlerLocator).

### Tests

On gardera toujours les tests fonctionnels simulant des requêtes avec le dispatcher à 
la racine du projet, même si ça n'a plus lieu d'être au TP4. Par contre, pour le webserver, il y a une toute nouvelle classe
de test qui simule des requêtes HTTP avec l'instantiation d'un webserver du module server.
Il est aussi possible de lancer les tests avec une base de vérification avec la collection POSTMAN, et en pensant
bien à lancer le serveur web avant `make serve` , et `make fixtures` pour charger les données de test.