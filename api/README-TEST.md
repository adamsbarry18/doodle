# 🚀 Test de l'API Doodle avec Docker

Ce guide explique comment déployer et tester l'API Doodle avec des services gratuits.

## 📋 Prérequis

- Docker et Docker Compose installés
- WSL Ubuntu (si sur Windows)
- Compte Mailtrap gratuit (optionnel)

## 🔧 Configuration

### 1. Configuration initiale

```bash
# Rendre les scripts exécutables
chmod +x setup-test-env.sh test-api.sh

# Configurer l'environnement
./setup-test-env.sh
```

### 2. Configuration Mailtrap (gratuit)

1. **Créer un compte** sur [https://mailtrap.io](https://mailtrap.io)
2. **Créer une inbox** dans votre projet
3. **Copier les credentials SMTP** :

   - Host: `smtp.mailtrap.io`
   - Port: `2525`
   - Username/Password: fournis par Mailtrap

4. **Modifier le fichier `.env`** :

```env
MAILTRAP_USERNAME=votre_username_mailtrap
MAILTRAP_PASSWORD=votre_password_mailtrap
```

### 3. Configuration Etherpad

**Option A - Etherpad local (recommandé)**

- Utilise l'instance Docker locale
- Pas de configuration supplémentaire nécessaire

**Option B - Etherpad.org (gratuit)**

1. Aller sur [https://etherpad.org](https://etherpad.org)
2. Créer un nouveau pad
3. Modifier dans `.env` :

```env
ETHERPAD_EXTERNAL_URL=https://votre-pad.etherpad.org
```

## 🚀 Démarrage

```bash
# Démarrer tous les services
docker-compose -f docker-compose-back.yaml up --build

# Ou en arrière-plan
docker-compose -f docker-compose-back.yaml up --build -d
```

## 🧪 Tests

### Test automatique

```bash
./test-api.sh
```

### Tests manuels

1. **Health Check** :

```bash
curl http://localhost:8081/q/health
```

2. **Interface OpenAPI** :

   - Ouvrir [http://localhost:8081/q/swagger-ui](http://localhost:8081/q/swagger-ui)

3. **PhpMyAdmin** :

   - Ouvrir [http://localhost:8080](http://localhost:8080)
   - Login: `tlc` / `tlc`

4. **Etherpad** :
   - Ouvrir [http://localhost:9001](http://localhost:9001)

## 📊 Services disponibles

| Service      | URL                                | Description                |
| ------------ | ---------------------------------- | -------------------------- |
| API Backend  | http://localhost:8081              | API Quarkus principale     |
| PhpMyAdmin   | http://localhost:8080              | Interface de gestion MySQL |
| Etherpad     | http://localhost:9001              | Éditeur collaboratif       |
| Health Check | http://localhost:8081/q/health     | Statut de l'API            |
| OpenAPI UI   | http://localhost:8081/q/swagger-ui | Documentation API          |

## 🔍 Debugging

### Voir les logs

```bash
# Logs de l'API
docker-compose -f docker-compose-back.yaml logs api

# Logs de tous les services
docker-compose -f docker-compose-back.yaml logs

# Logs en temps réel
docker-compose -f docker-compose-back.yaml logs -f
```

### Vérifier les conteneurs

```bash
docker-compose -f docker-compose-back.yaml ps
```

### Redémarrer un service

```bash
docker-compose -f docker-compose-back.yaml restart api
```

## 🛑 Arrêt

```bash
# Arrêter les services
docker-compose -f docker-compose-back.yaml down

# Arrêter et supprimer les volumes
docker-compose -f docker-compose-back.yaml down -v
```

## 📧 Test des emails

1. **Configurer Mailtrap** dans le fichier `.env`
2. **Utiliser l'API** pour envoyer un email
3. **Vérifier** dans l'inbox Mailtrap

## 🔧 Variables d'environnement

Le fichier `.env` contient toutes les configurations :

- **Base de données** : MySQL local
- **Email** : Mailtrap (gratuit)
- **Etherpad** : Instance locale ou etherpad.org
- **API** : Configuration Quarkus

## ❗ Problèmes courants

### L'API ne démarre pas

- Vérifier que MySQL est "healthy"
- Vérifier les logs : `docker-compose logs api`
- Vérifier la configuration dans `.env`

### Erreur de connexion à la base

- Attendre que MySQL soit complètement initialisé
- Vérifier les credentials dans `.env`
- Redémarrer : `docker-compose restart api`

### Etherpad inaccessible

- Vérifier que le port 9001 n'est pas utilisé
- Vérifier les logs : `docker-compose logs etherpad`
