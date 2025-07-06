# Script de déploiement pour Doodle depuis la racine du projet
Write-Host "🚀 Déploiement de l'application Doodle..." -ForegroundColor Green

# Vérifier que nous sommes dans le bon répertoire
if (-not (Test-Path "api") -or -not (Test-Path "front")) {
    Write-Host "❌ Erreur: Ce script doit être exécuté depuis la racine du projet (dossier contenant api/ et front/)" -ForegroundColor Red
    exit 1
}

# Arrêter et supprimer les conteneurs existants
Write-Host "🛑 Arrêt des conteneurs existants..." -ForegroundColor Yellow
Set-Location api
wsl docker-compose down
Set-Location ..

# Supprimer les images existantes pour forcer la reconstruction
Write-Host "🗑️ Suppression des images existantes..." -ForegroundColor Yellow
wsl docker rmi doodle-api 2>$null
wsl docker rmi doodle-front 2>$null

# Construire et démarrer les services
Write-Host "🔨 Construction et démarrage des services..." -ForegroundColor Yellow
Set-Location api
wsl docker-compose up --build -d
Set-Location ..

# Attendre que les services soient prêts
Write-Host "⏳ Attente du démarrage des services..." -ForegroundColor Yellow
Start-Sleep -Seconds 30

# Vérifier le statut des conteneurs
Write-Host "📊 Statut des conteneurs:" -ForegroundColor Green
Set-Location api
wsl docker-compose ps
Set-Location ..

Write-Host "✅ Déploiement terminé!" -ForegroundColor Green
Write-Host "🌐 Application accessible sur: http://localhost:90" -ForegroundColor Cyan
Write-Host "📧 MailDev accessible sur: http://localhost:2525" -ForegroundColor Cyan
Write-Host "🗄️ PhpMyAdmin accessible sur: http://localhost:8080" -ForegroundColor Cyan 