# Script de déploiement pour Doodle
Write-Host "🚀 Déploiement de l'application Doodle..." -ForegroundColor Green

# Arrêter et supprimer les conteneurs existants
Write-Host "🛑 Arrêt des conteneurs existants..." -ForegroundColor Yellow
docker-compose down

# Supprimer les images existantes pour forcer la reconstruction
Write-Host "🗑️ Suppression des images existantes..." -ForegroundColor Yellow
docker rmi doodle-api 2>$null
docker rmi doodle-front 2>$null

# Construire et démarrer les services
Write-Host "🔨 Construction et démarrage des services..." -ForegroundColor Yellow
docker-compose up --build -d

# Attendre que les services soient prêts
Write-Host "⏳ Attente du démarrage des services..." -ForegroundColor Yellow
Start-Sleep -Seconds 30

# Vérifier le statut des conteneurs
Write-Host "📊 Statut des conteneurs:" -ForegroundColor Green
docker-compose ps

Write-Host "✅ Déploiement terminé!" -ForegroundColor Green
Write-Host "🌐 Application accessible sur: http://localhost:90" -ForegroundColor Cyan
Write-Host "📧 MailDev accessible sur: http://localhost:2525" -ForegroundColor Cyan
Write-Host "🗄️ PhpMyAdmin accessible sur: http://localhost:8080" -ForegroundColor Cyan 