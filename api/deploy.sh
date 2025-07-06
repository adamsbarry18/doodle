#!/bin/bash

# Script de déploiement pour Doodle
echo "🚀 Déploiement de l'application Doodle..."

# Arrêter et supprimer les conteneurs existants
echo "🛑 Arrêt des conteneurs existants..."
docker-compose down

# Supprimer les images existantes pour forcer la reconstruction
echo "🗑️ Suppression des images existantes..."
docker rmi doodle-api 2>/dev/null || true
docker rmi doodle-front 2>/dev/null || true

# Construire et démarrer les services
echo "🔨 Construction et démarrage des services..."
docker-compose up --build -d

# Attendre que les services soient prêts
echo "⏳ Attente du démarrage des services..."
sleep 30

# Vérifier le statut des conteneurs
echo "📊 Statut des conteneurs:"
docker-compose ps

echo "✅ Déploiement terminé!"
echo "🌐 Application accessible sur: http://localhost:90"
echo "📧 MailDev accessible sur: http://localhost:2525"
echo "🗄️ PhpMyAdmin accessible sur: http://localhost:8080" 