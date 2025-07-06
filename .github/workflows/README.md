# CI/CD Pipeline Configuration

Ce dossier contient les workflows GitHub Actions pour automatiser le déploiement de l'application Doodle.

## 📁 Structure des Workflows

### 1. `main-ci-cd.yml`

- **Workflow principal** qui orchestre les déploiements
- **Détecte automatiquement** les changements dans `front/` ou `api/`
- **Déclenche** les workflows appropriés selon les modifications

### 2. `frontend-ci-cd.yml`

- **Tests** : Lint, Type check, Unit tests
- **Build** : Production build Angular
- **Déploiement** : Vercel (frontend)

### 3. `backend-ci-cd.yml`

- **Tests** : Tests Maven/Java
- **Build** : Image Docker Quarkus
- **Déploiement** : Azure Web App (backend)

## 🔧 Configuration Requise

### Secrets GitHub

#### Pour Vercel (Frontend) :

```bash
VERCEL_TOKEN=your_vercel_token
VERCEL_ORG_ID=your_vercel_org_id
VERCEL_PROJECT_ID=your_vercel_project_id
```

#### Pour Azure (Backend) :

```bash
AZURE_CREDENTIALS=your_azure_service_principal_json
AZURE_WEBAPP_NAME=your_azure_webapp_name
```

## 🚀 Déploiement

### Déclenchement Automatique

- **Push sur `main`** : Déploiement en production
- **Push sur `dev`** : Build et tests uniquement
- **Pull Request** : Tests uniquement

### Déclenchement Manuel

- Via l'interface GitHub Actions
- Sélection du workflow souhaité

## 📊 Monitoring

### Artifacts Générés

- **Test Results** : Résultats des tests (30 jours)
- **Build Artifacts** : Fichiers de build (7 jours)
- **Coverage Reports** : Rapports de couverture

### Logs

- Accessibles via l'interface GitHub Actions
- Historique complet des déploiements

## 🔍 Dépannage

### Problèmes Courants

1. **Échec des tests** : Vérifier les logs de test
2. **Échec du build** : Vérifier les dépendances
3. **Échec du déploiement** : Vérifier les secrets

### Commandes Utiles

```bash
# Vérifier les secrets
gh secret list

# Voir les logs d'un workflow
gh run view <run-id>

# Relancer un workflow
gh run rerun <run-id>
```

## 📝 Notes Importantes

- Les workflows utilisent **GitHub Container Registry** pour les images Docker
- Le **cache** est activé pour optimiser les builds
- Les **environnements** sont configurés pour la production
- Les **artifacts** sont automatiquement nettoyés
