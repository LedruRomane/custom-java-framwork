# Intergiciel et services

Enzo Cecillon & Romane Ledru 

Master TIW 2023/2024

## Étude et mise en place d'un Framework Java 🧐

Ce projet a été réalisé dans le cadre de l'unité d'enseignement Intergiciel et Service (IS), qui vise à préparer les étudiants à travailler sur des systèmes d'information de dimension industrielle.

Le projet nous a permis de comprendre et d'expérimenter le fonctionnement des frameworks basés sur des composants et des services, ainsi que de programmer et déployer ces éléments sur un serveur d'applications.

Ce document sert de registre détaillant les concepts clés explorés durant notre phase de développement, les décisions techniques prises pour répondre aux exigences du projet et les instructions pour configurer un environnement de travail similaire à celui que nous avons utilisé.
## Objectifs pédagogiques du projet 🎯

- Appliquer différents patterns de conception (IoC, Contexte, Annuaire, Object pool, etc.) pour mieux comprendre le fonctionnement d'un framework.
- Configurer un outil capable de gérer le cycle de vie de ses composants de manière autonome.
- Utiliser des annotations pour automatiser la génération de code "boilerplate" non spécifique à une application.


# Usages

### Lancer le serveur web

```bash
make serve
```
> 1. Lance le container postgresql.
> 2. Lance le container rabbitMQ sur `http://localhost:15672/` user `guest` password `guest`.
> 3. Load les fixtures via un dump de données de dev.
> 4. Lance le serveur web, API disponible sur `http://localhost:8000`.
### Lancer les tests

```bash
make test
```
> Lance les tests unitaires et fonctionnels.

### Gérer la base de donnée
    
```bash
make db.reset
```
> Note: cette commande relance les containers, il faudra donc relancer `make serve` si celui-ci était déjà lancé.

```bash
make db.fixtures
```
> Charge les fixtures via un dump de données de dev.

Voir une collection POSTMAN pour les requêtes API :

`./catalogue-vols/src/main/resources/TIW-IS.postman_collection.json`

## Documentation TP

- [Readme Développement CommandBus & mise en place PicoContainer (TP2)](./docs/Handler.md)
- [Readme Ajout annotations](./docs/Server.md)
- [Readme Webserver et génération de Servlet](./docs/Server.md)