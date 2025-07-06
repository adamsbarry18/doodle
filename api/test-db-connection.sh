#!/bin/bash

echo "🧪 Test de connexion à la base de données externe"
echo "=================================================="

# Charger les variables d'environnement
if [ -f ".env" ]; then
    export $(cat .env | grep -v '^#' | xargs)
    echo "✅ Fichier .env chargé"
else
    echo "❌ Fichier .env non trouvé"
    exit 1
fi

echo ""
echo "📊 Configuration détectée :"
echo "   Host: $DB_HOST"
echo "   Port: $DB_PORT"
echo "   Database: $DB_NAME"
echo "   User: $QUARKUS_DATASOURCE_USERNAME"
echo ""

# Test de connexion avec mysql client (si disponible)
if command -v mysql &> /dev/null; then
    echo "🔍 Test de connexion MySQL..."
    if mysql -h "$DB_HOST" -P "$DB_PORT" -u "$QUARKUS_DATASOURCE_USERNAME" -p"$QUARKUS_DATASOURCE_PASSWORD" "$DB_NAME" -e "SELECT 1;" 2>/dev/null; then
        echo "✅ Connexion MySQL réussie"
    else
        echo "❌ Échec de la connexion MySQL"
        echo "   Vérifiez :"
        echo "   - Les credentials dans .env"
        echo "   - L'accessibilité du serveur $DB_HOST:$DB_PORT"
        echo "   - Les permissions de l'utilisateur"
    fi
else
    echo "⚠️  Client MySQL non disponible, test de connectivité réseau..."
    if nc -z "$DB_HOST" "$DB_PORT" 2>/dev/null; then
        echo "✅ Port $DB_PORT accessible sur $DB_HOST"
    else
        echo "❌ Port $DB_PORT non accessible sur $DB_HOST"
    fi
fi

echo ""
echo "🚀 Pour lancer l'API avec la base externe :"
echo "   docker-compose -f docker-compose-back.yaml up --build" 