#!/bin/bash

# =========================
# Laravel Docker Init Script
# =========================

echo "🚀 Iniciando contenedor Laravel..."

# Verificar que los directorios existan
echo "📁 Verificando directorios de Laravel..."
mkdir -p storage/logs storage/framework/cache storage/framework/sessions storage/framework/testing storage/framework/views bootstrap/cache

# Arreglar permisos para Laravel
echo "🔐 Configurando permisos..."
chown -R www-data:www-data storage bootstrap/cache
chmod -R 775 storage bootstrap/cache

# Verificar conexión a base de datos (opcional)
echo "🗄️ Verificando conexión a base de datos..."
php artisan migrate --force 2>/dev/null || echo "⚠️ Base de datos no disponible aún (normal en primer arranque)"

# Limpiar cache si existe
# echo "🧹 Limpiando cache..."
# php artisan cache:clear 2>/dev/null || echo "ℹ️ Cache no encontrado (normal en primer arranque)"
# php artisan config:clear 2>/dev/null || echo "ℹ️ Config cache no encontrado"
# php artisan view:clear 2>/dev/null || echo "ℹ️ View cache no encontrado"

echo "✅ Contenedor Laravel listo!"
echo "🌐 Acceso: https://localhost:8441"
echo "⚡ Vite: docker exec -it my-project-nginx-app npm run hot"
echo ""

# Ejecutar el comando original (php-fpm)
exec "$@"
