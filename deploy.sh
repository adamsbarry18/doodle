#!/bin/bash

# Script de déploiement pour Doodle depuis la racine du projet
echo "🚀 Déploiement de l'application Doodle..."

# Vérifier que nous sommes dans le bon répertoire
if [ ! -d "api" ] || [ ! -d "front" ]; then
    echo "❌ Erreur: Ce script doit être exécuté depuis la racine du projet (dossier contenant api/ et front/)"
    exit 1
fi

# Arrêter et supprimer les conteneurs existants
echo "🛑 Arrêt des conteneurs existants..."
cd api
docker-compose down
cd ..

# Supprimer les images existantes pour forcer la reconstruction
echo "🗑️ Suppression des images existantes..."
docker rmi doodle-api 2>/dev/null || true
docker rmi doodle-front 2>/dev/null || true

# Construire et démarrer les services
echo "🔨 Construction et démarrage des services..."
cd api
docker-compose up --build -d
cd ..

# Attendre que les services soient prêts
echo "⏳ Attente du démarrage des services..."
sleep 30

# Vérifier le statut des conteneurs
echo "📊 Statut des conteneurs:"
cd api
docker-compose ps
cd ..

echo "✅ Déploiement terminé!"
echo "🌐 Application accessible sur: http://localhost:90"
echo "📧 MailDev accessible sur: http://localhost:2525"
echo "🗄️ PhpMyAdmin accessible sur: http://localhost:8080" 