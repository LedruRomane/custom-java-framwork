## Qu'est-ce qu'un Framework et comment fonctionne-t-il ? 💡

Un framework, en programmation, est comparable à un kit de construction ou à un ensemble d'outils préfabriqués. Imaginez construire une maison : vous pourriez fabriquer chaque brique et chaque fenêtre à partir de zéro (programmation sans framework), ou utiliser des éléments préconstruits à assembler selon un plan (programmation avec un framework).

### Avantages pour une application

1. **Rapidité de développement :** Les frameworks offrent des composants standards et réutilisables qui économisent du temps de développement.
2. **Fiabilité :** Développés et testés par de nombreux professionnels, ils assurent la stabilité et la sécurité des applications.
3. **Meilleures pratiques :** Ils incitent à utiliser des techniques de programmation éprouvées et à organiser le code de manière cohérente.

### Enjeux et difficultés

1. **Courbe d'apprentissage :** La complexité et la richesse des fonctionnalités des frameworks peuvent exiger un temps d'adaptation.
2. **Équilibre entre flexibilité et contraintes :** Les règles et la structure imposées peuvent limiter la personnalisation pour des besoins spécifiques.
3. **Dépendance :** S'appuyer sur un framework implique de dépendre de son évolution et de sa maintenance par d'autres.

## Design Patterns 🔨

### Inversion of Control (IoC) ⛓️

Le but de l'IoC est d'empêcher les classes de créer des instances et de dépendre d'autres composants directement. Cela facilite le remplacement des objets pour les tests ou pour harmoniser des pipelines entre différents services.

L'IoC peut prendre différentes formes :

- **Conteneurs** : Par exemple, PicoContainer dans notre projet.
- **Pattern Observateur** : Notifie les composants abonnés lorsqu'un événement spécifique se produit.
- **Injection de dépendance (Dependency Injection)**.

### Dependency Injection 💉

L'injection de dépendance est une méthode permettant de gérer uniformément différents types d'instances sans que les composants créent directement leurs dépendances. Elles sont "injectées", typiquement par un conteneur IoC ou un framework. Les avantages sont multiples :

- **Flexibilité** : Les composants peuvent être échangés sans modifier le code qui les utilise.
- **Facilité de test** : Les dépendances peuvent être simulées par des mock objects, facilitant les tests unitaires.
- **Maintenabilité** : Le code est plus propre et centralisé, facilitant sa compréhension et sa maintenance.

#### Exemple conceptuel

Supposons que nous ayons une interface `StorageService` avec des méthodes pour sauvegarder et récupérer des données. Des implémentations spécifiques pour AWS et Google Cloud pourraient être créées. Un `DataManager` dépendrait de `StorageService` et serait fourni via son constructeur ou un setter, une forme d'injection de dépendance.

```java
class DataManager {
    private StorageService storageService;

    public DataManager(StorageService storageService) {
        this.storageService = storageService;
    }

    public void saveData(String data) {
        storageService.save(data);
    }

    public String retrieveData(String key) {
        return storageService.retrieve(key);
    }
}
```

En instanciant `DataManager` avec l'implémentation de service de stockage appropriée, nous pouvons facilement basculer entre différents fournisseurs de stockage :

```java
StorageService awsService = new AwsStorageService();
DataManager dataManagerForAWS = new DataManager(awsService);

StorageService googleService = new GoogleCloudStorageService();
DataManager dataManagerForGoogle = new DataManager(googleService);
```

Dans notre projet, **PicoContainer** s'occupe de l'injection automatique de ces services.

```java
picoContainer.addComponent(AwsStorageService.class);
picoContainer.addComponent(GoogleCloudStorageService.class);
picoContainer.addComponent(DataManager.class);

DataManager dataManagerForAWS = picoContainer.getComponent(AwsStorageService.class);
DataManager dataManagerForGoogle = picoContainer.getComponent(GoogleCloudStorageService.class);
```

Cela illustre l'indépendance de `DataManager` vis-à-vis du système de stockage spécifique utilisé, favorisant une conception modulable et maintenable.

### Command Bus 🚌

Le pattern Command Bus permet de séparer la réception d'une requête (la commande) de son exécution, en acheminant les commandes vers les gestionnaires correspondants (handlers). Les principaux objectifs sont :

1. **Séparation des préoccupations** : Distinction nette entre la logique de déclenchement et celle de traitement.
2. **Facilité de maintenance et d'extension** : Ajout et modification aisés de nouvelles commandes sans impacter le reste du système.
3. **Découplage** : Réduction des dépendances directes entre les différentes parties de l'application, améliorant ainsi testabilité et flexibilité.

#### Fonctionnement

- **Commande** : Un objet représentant une action à exécuter, contenant les données nécessaires.
- **Command Bus** : Reçoit les commandes et les délègue aux gestionnaires appropriés.
- **Command Handler** : Composant chargé d'exécuter une commande donnée.

Illustration de Romane montrant le fonctionnement synchrone et asynchrone du pattern :

![CommandBus](docs/images/CommandBus.png)

## Ressources utilisées 📄

- [Refactorisation et patrons de conception](https://refactoring.guru/fr)
- [Dependency Injection, The Best Pattern - YouTube](https://www.youtube.com/watch?v=J1f5b4vcxCQ)
- [Inversion of Control - YouTube](https://www.youtube.com/watch?v=vFzP2SaMyA0)
- [10 Design Patterns Explained in 10 Minutes - YouTube](https://www.youtube.com/watch?v=tv-_1er1mWI&pp=ygUQY29udGV4dCBwYXR0ZXJuIA%3D%3D)


## Technologies utilisées 💻

- **PicoContainer**: Une [librairie Java](http://picocontainer.com/introduction.html) conçue pour l'injection de dépendances, qui se distingue par sa simplicité et sa légèreté, facilitant l'intégration et la gestion des dépendances dans les projets.

### Mapping des Commandes à un Handler

Un défi de l'implémentation de la partie serveur de notre framework a été l'association des commandes à leur handler correspondant. Nous aurions pu définir cette association dans le fichier `appConfiguration`, mais cela aurait réduit la dynamique et la facilité de modification future.

```json
{ // ❌
	"ceateBaggageCommand": "tiw.is.vols.livraison.handler.resource.baggage.CreateBaggageCommandHandler",
	"deleteBaggageCommand": "tiw.is.vols.livraison.handler.resource.baggage.DeleteBaggageCommandHandler",
},
```

Nous avons opté pour une Hashmap (`handlerLocator`) avec la signature suivante : `<Class, ICommandHandler<Object, ICommand>>`
- `Class` : La signature d'une classe implémentant l'interface `ICommand` que l'on récupère dans la définition de la classe du `Handler`.
- `ICommandHandler<Object, ICommand>`
    - `Object`: Type de l'objet retourné par notre Handler.
    - `ICommand`: Type de la Commande qui sera pris en entrée par la méthode `handle` des classes `Handler`.

Avec cette Hashmap, nous avons appliqué le pattern **Command Bus** pour déléguer facilement les commandes à leurs handlers appropriés.

Cet arrangement permet à notre serveur de dynamiquement diriger les commandes entrantes vers leurs gestionnaires respectifs, en utilisant le mécanisme centralisé du Command Bus. Ce mécanisme facilite l'ajout ou la modification des commandes et de leurs traitements, tout en conservant une structure de code claire et maintenable.

## Fonctionnement des Tests 🎢

Nous utilisons le framework de test [JUnit 5](https://junit.org/junit5/) pour garantir la qualité, la fiabilité et l'efficacité de notre code durant le développement.

D'autre part, nous nous appuyons sur des snapshots qui sont nos sources de vérités pour certains de nos tests.

### Structure

Nos tests sont organisés autour de deux axes principaux :
- Les tests de la logique métier.
- Les tests d'opérations CRUD sur le serveur.

Ces trois axes sont les piliers de notre application et permettent, en cas de nouvelles fonctionnalités, d'assurer qu'aucune régression n'a été introduite.

Par ailleurs, les tests sont un bon point d'entrée pour comprendre comment fonctionne notre application et suivre le fil d’exécution d'une opération métier ou interne au serveur.

Les dossiers `controller`, `dao`, `db` sont des tests plus unitaires mais legacy.
C'est assez intéressant pour un dévelopeur de prendre connaissance de ces derniers mais nous ne nous appuyons pas vraiment sur ces derniers pour vérifier la qualité de notre application.

#### Tests de logique métier

Ces tests sont le point d'entrée de notre application, ils permettent de vérifier que l'application est capable de répondre aux demandes des clients qui souhaiteraient récupérer ou manipuler des ressources tout en respectant leurs exigences et leurs attentes.

On peut distinguer ces tests par la présence du mot `Business` dans le nom du fichier.

Pour mieux comprendre, prenons l'exemple de `BagageBusinessTest` qui teste les deux choses suivantes :
- Récupérer un bagage et ses informations.
- Déposer un bagage.

Ces deux fonctions n'ont aucune connaissance sur la manière dont le serveur va traiter ces demandes. Ce que l'on souhaite en tant que client, c'est donner les informations nécessaires pour pouvoir récupérer ce que l'on souhaite.

Ce sont donc des tests d'intégration qui vont nous permettre de vérifier que si on modifie quelque chose dans les couches basses (côté serveur), ces opérations fonctionnent encore et retournent bien ce qu'attend le client.

Ces tests sont agnostiques vis-à-vis de la manière dont on a implémenté notre serveur pour traiter la demande du client, on pourrait donc très bien déclencher une requête vers un serveur en Rust pour que le client récupère quand même la même ressource 💡.

#### Tests d'opérations

Ces tests se concentrent sur le test des fonctionnalités CRUD de notre serveur qui permettent à ce dernier de gérer les ressources auprès de nos sources de données (dans notre cas une base de données PostgreSQL).

C'est donc la couche intermédiaire entre la partie Métier et la partie fonctionnel du serveur.

## Installation et mise en route 🚀

### Pré-requis ‼️

- **Docker Desktop** pour naviguer sur [Windows / Mac OS X](https://www.docker.com/get-started). Pour les aficionados de Linux, c'est par ici : [Install Docker Engine](https://docs.docker.com/engine/install/)
- **Java 21** : Prenez la route d'[Adoptium](https://adoptium.net/) pour la distribution Java Tumerin, ou faites un petit détour par [SDKMan](https://sdkman.io/)
- **Maven** : Votre compagnon [gestionnaire de paquets Java](https://maven.apache.org/download.cgi)

Petit plus : Un tour rapide avec [Maven – Maven en 5 Minutes](https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html)

###  Prise en main ⚙️

#### Lancer une base de données locale PostgreSQL 💿

Ouvrez un terminal et rendez-vous à la racine du projet, où se trouve le fichier `docker-compose.yaml`.

Lancer un conteneur PostgreSQL à l'aide de la commande suivante :

```shell
docker compose up -d
```

> Oups ! Un hic ? Vérifiez que le `docker-deamon` n'est pas en pause café !

Cette étape est très importante puisqu'elle va permettre à notre serveur de lancer les tests et vérifier que notre serveur est fonctionnel.

#### Build du projet

> **Note**: Mlle LEDRU, notre mécano de génie, vous a préparé un makefile pour retrouver et exécuter à tous moment les commandes que nous allons décrire.

À l'aide de Maven, nous allons compiler le projet, lancer les tests et préparer les binaires pour packager notre application :

1. Ouvrez un terminal à la racine du projet.
2. Lancez la commande suivante :
```shell
mvn clean package # Ou en un clin d'œil avec "make build" 😉
```

Pour zapper les tests et gagner du temps :

```shell
mvn clean package -Dmaven.test.skip=true # Ou en mode rapide "make build"
```

#### Lancement des tests 🧪

```shell
mvn clean compile # ou "make test"
```

- `clean`: fait un peu de rangement dans les artefacts laissés par les précédents montages.
- `compile`: Assemble les binaires de notre application, intègre les dépendances de notre pom.xml et lance les tests JUnit.

> Romane Ledru
>
> Enzo Cecillon
