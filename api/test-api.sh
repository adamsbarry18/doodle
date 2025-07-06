#!/bin/bash

echo "🧪 Test de l'API Doodle"
echo "========================"

# Attendre que l'API soit prête
echo "⏳ Attente du démarrage de l'API..."
sleep 10

# Test 1: Health Check
echo ""
echo "1️⃣ Test du Health Check..."
if curl -f http://localhost:8081/q/health > /dev/null 2>&1; then
    echo "✅ Health Check: OK"
else
    echo "❌ Health Check: ÉCHEC"
    echo "   Vérifiez que l'API est démarrée: docker-compose -f docker-compose-back.yaml ps"
fi

# Test 2: OpenAPI/Swagger
echo ""
echo "2️⃣ Test de l'interface OpenAPI..."
if curl -f http://localhost:8081/q/swagger-ui > /dev/null 2>&1; then
    echo "✅ OpenAPI UI: OK (http://localhost:8081/q/swagger-ui)"
else
    echo "⚠️  OpenAPI UI: Non disponible"
fi

# Test 3: Base de données via PhpMyAdmin
echo ""
echo "3️⃣ Test de PhpMyAdmin..."
if curl -f http://localhost:8080 > /dev/null 2>&1; then
    echo "✅ PhpMyAdmin: OK (http://localhost:8080)"
    echo "   Login: tlc / tlc"
else
    echo "❌ PhpMyAdmin: ÉCHEC"
fi

# Test 4: Etherpad
echo ""
echo "4️⃣ Test d'Etherpad..."
if curl -f http://localhost:9001 > /dev/null 2>&1; then
    echo "✅ Etherpad: OK (http://localhost:9001)"
else
    echo "❌ Etherpad: ÉCHEC"
fi

# Test 5: Endpoints API spécifiques
echo ""
echo "5️⃣ Test des endpoints API..."

# Test des polls (si l'endpoint existe)
if curl -f http://localhost:8081/api/polls > /dev/null 2>&1; then
    echo "✅ Endpoint /api/polls: OK"
else
    echo "⚠️  Endpoint /api/polls: Non disponible ou erreur"
fi

# Test des users (si l'endpoint existe)
if curl -f http://localhost:8081/api/users > /dev/null 2>&1; then
    echo "✅ Endpoint /api/users: OK"
else
    echo "⚠️  Endpoint /api/users: Non disponible ou erreur"
fi

echo ""
echo "🎯 Résumé des URLs:"
echo "   - API Backend: http://localhost:8081"
echo "   - PhpMyAdmin: http://localhost:8080"
echo "   - Etherpad: http://localhost:9001"
echo "   - Health Check: http://localhost:8081/q/health"
echo "   - OpenAPI UI: http://localhost:8081/q/swagger-ui"
echo ""
echo "📝 Pour voir les logs en temps réel:"
echo "   docker-compose -f docker-compose-back.yaml logs -f api" 