# Intergiciel et services

Enzo Cecillon & Romane Ledru 

Master TIW 2023/2024

# Usages

### Lancer le serveur web

```bash
make serve
```
> 1. Lance le container postgresql.
> 2. Load les fixtures via un dump de données de dev.
> 3. Lance le serveur web, API disponible sur `http://localhost:8000`.
### Lancer les tests

```bash
make test
```
> Lance les tests unitaires et fonctionnels.

Voir la collection POSTMAN pour les requêtes API : 

`./catalogue-vols/src/main/resources/TIW-IS.postman_collection.json`

## Documentation TP

- [Readme TP2](./doc/TP2.md)
- [Readme TP3](./doc/TP3.md)
- [Readme TP4](./doc/TP4.md)