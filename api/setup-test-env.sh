#!/bin/bash

echo "🚀 Configuration de l'environnement de test pour Doodle API"

# Vérifier si le fichier .env existe
if [ ! -f ".env" ]; then
    echo "📝 Création du fichier .env à partir de env.example..."
    cp env.example .env
    echo "✅ Fichier .env créé. Veuillez le modifier avec vos vraies valeurs."
    echo ""
    echo "📧 Pour Mailtrap (gratuit):"
    echo "   1. Allez sur https://mailtrap.io"
    echo "   2. Créez un compte gratuit"
    echo "   3. Créez une inbox"
    echo "   4. Copiez les credentials SMTP dans .env"
    echo ""
    echo "📝 Pour Etherpad (gratuit):"
    echo "   Option 1 - Etherpad local (déjà configuré):"
    echo "   - Utilise l'instance locale dans Docker"
    echo ""
    echo "   Option 2 - Etherpad.org (gratuit):"
    echo "   - Allez sur https://etherpad.org"
    echo "   - Créez un pad et copiez l'URL"
    echo "   - Modifiez ETHERPAD_EXTERNAL_URL dans .env"
    echo ""
    echo "🔧 Modifiez le fichier .env avec vos vraies valeurs, puis relancez ce script."
    exit 1
fi

echo "✅ Fichier .env trouvé"
echo "🔧 Vérification de la configuration..."

# Vérifier si les variables Mailtrap sont configurées
if grep -q "your_mailtrap_username" .env; then
    echo "⚠️  Attention: Les credentials Mailtrap ne sont pas configurés dans .env"
    echo "   Veuillez les remplacer par vos vraies valeurs"
fi

# Vérifier si l'APIKEY.txt existe
if [ ! -f "APIKEY.txt" ]; then
    echo "🔑 Génération d'une clé API Etherpad..."
    echo "your_etherpad_api_key_$(date +%s)" > APIKEY.txt
    echo "✅ Clé API Etherpad générée"
fi

echo ""
echo "🎯 Services disponibles après démarrage:"
echo "   - API Backend: http://localhost:8081"
echo "   - PhpMyAdmin: http://localhost:8080"
echo "   - Etherpad: http://localhost:9001"
echo "   - Health Check: http://localhost:8081/q/health"
echo ""
echo "🚀 Pour démarrer les services:"
echo "   docker-compose -f docker-compose-back.yaml up --build"
echo ""
echo "🧪 Pour tester l'API:"
echo "   curl http://localhost:8081/q/health" 