# 🚀 Stack de Desarrollo Laravel con Docker

<div align="center">

**Entorno de desarrollo Laravel listo para producción con Docker, NGINX y herramientas modernas**

---

## 🌐 Documentation Languages | Idiomas de Documentación

<table align="center">
<tr>
<td align="center" width="50%">

### 🇺🇸 **English**
**🔗 Go to English** • *Ir a Inglés*

[![English Documentation](https://img.shields.io/badge/English-Documentation-blue?style=for-the-badge&logo=readme&logoColor=white)](README.md)

</td>
<td align="center" width="50%">

### 🇪🇸 **Español**
**📍 Estás aquí** • *You are here*

[![Documentación en Español](https://img.shields.io/badge/Español-Documentación-red?style=for-the-badge&logo=readme&logoColor=white)](README.es.md)

</td>
</tr>
</table>

---

[![Docker](https://img.shields.io/badge/Docker-20.10+-0db7ed?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![Laravel](https://img.shields.io/badge/Laravel-11+-FF2D20?style=for-the-badge&logo=laravel&logoColor=white)](https://laravel.com/)
[![PHP](https://img.shields.io/badge/PHP-8.4-777BB4?style=for-the-badge&logo=php&logoColor=white)](https://php.net/)
[![Vite](https://img.shields.io/badge/Vite-6+-646CFF?style=for-the-badge&logo=vite&logoColor=white)](https://vitejs.dev/)
[![MySQL](https://img.shields.io/badge/MySQL-8.0-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://mysql.com/)

</div>

---

## ✨ Características

<table>
<tr>
<td width="50%">

### 🏗️ **Stack Principal**
- **PHP 8.4** con optimización FPM
- **Laravel 11** con configuración completa
- **NGINX 1.28** con soporte SSL
- **MySQL 8.0** + **PostgreSQL 16**
- **Vite 6** con Hot Module Replacement
- **Tailwind CSS 4** para estilos

</td>
<td width="50%">

### 🛠️ **Herramientas de Desarrollo**
- **Xdebug 3** para debugging
- **phpMyAdmin** para gestión de MySQL
- **pgAdmin** para gestión de PostgreSQL
- **Hot Reload** con servidor de desarrollo Vite
- **Certificados SSL** para HTTPS
- **Composer** y **npm** preinstalados

</td>
</tr>
</table>

---

## 🚀 Inicio Rápido

### 🆕 Primera Configuración

```bash
# Clonar el repositorio
git clone https://github.com/Jsriv22/docker-laravel-nginx-mysql-postgres.git
cd docker-laravel-nginx-mysql-postgres

# Construir e iniciar contenedores
docker compose up -d --build

# Ejecutar migraciones (soluciona error de tabla sessions)
docker exec -it my-project-nginx-app php artisan migrate

# Generar clave de aplicación (opcional)
docker exec -it my-project-nginx-app php artisan key:generate
```

### 💻 Desarrollo Diario

```bash
# Iniciar contenedores
docker compose up -d

# Iniciar Vite con hot reload (mantener terminal abierta)
docker exec -it my-project-nginx-app npm run hot

# ¡A programar! Accede a tu aplicación en https://localhost:8441
```

---

## 🌐 URLs de Servicios

<div align="center">

| Servicio | URL | Credenciales |
|----------|-----|--------------|
| **🌟 Laravel (HTTPS)** | https://localhost:8441 | - |
| **🌐 Laravel (HTTP)** | http://localhost:8001 | - |
| **📊 phpMyAdmin** | http://localhost:8081 | `adminmysqldocker` / `password_enviroment` |
| **🛠️ pgAdmin** | http://localhost:8082 | `admin@admin.com` / `admin123` |

</div>

---

### 📁 Estructura del Proyecto

```
📦 docker-laravel-nginx-mysql-postgres/
├── 🐳 docker/
│   ├── 🌐 nginx/              # Configuración del servidor web
│   │   ├── nginx.conf         # Configuración NGINX + SSL
│   │   └── certs/             # Certificados SSL
│   ├── 🐘 php/                # Contenedor PHP
│   │   ├── DockerFile         # PHP 8.4 + Node.js 22 + Xdebug
│   │   ├── php.ini            # Configuraciones PHP optimizadas
│   │   └── xdebug/            # Configuración de debugging
│   ├── 🗄️ mysql/              # Base de datos MySQL
│   └── 🐘 postgresql/         # Base de datos PostgreSQL
├── 📄 docker-compose.yaml     # Orquestación de servicios
├── ⚡ vite.config.js          # Configuración Vite para Docker
├── 🔧 .env                    # Variables de entorno
├── 📦 package.json            # Dependencias Node.js
└── 🎼 composer.json           # Dependencias PHP
```

---

## 🎯 Comandos Comunes

<details>
<summary><strong>🐳 Comandos Docker</strong></summary>

```bash
# Ver estado de contenedores
docker compose ps

# Ver logs en tiempo real
docker compose logs -f app
docker compose logs -f nginx

# Entrar al contenedor PHP
docker exec -it my-project-nginx-app bash

# Reiniciar servicios
docker compose restart app
docker compose restart nginx

# Reinicio limpio
docker compose down -v
docker compose up -d --build
```

</details>

<details>
<summary><strong>🎼 Comandos Laravel</strong></summary>

```bash
# Migraciones de base de datos
docker exec -it my-project-nginx-app php artisan migrate
docker exec -it my-project-nginx-app php artisan migrate:rollback
docker exec -it my-project-nginx-app php artisan migrate:fresh --seed

# Limpiar cachés
docker exec -it my-project-nginx-app php artisan cache:clear
docker exec -it my-project-nginx-app php artisan config:clear
docker exec -it my-project-nginx-app php artisan view:clear

# Generar archivos
docker exec -it my-project-nginx-app php artisan make:controller ProductController
docker exec -it my-project-nginx-app php artisan make:model Product -m
docker exec -it my-project-nginx-app php artisan make:migration create_products_table
```

</details>

<details>
<summary><strong>⚡ Comandos Vite/Assets</strong></summary>

```bash
# Desarrollo con hot reload
docker exec -it my-project-nginx-app npm run hot

# Build para producción
docker exec -it my-project-nginx-app npm run build

# Instalar nuevas dependencias
docker exec -it my-project-nginx-app npm install package-name
docker exec -it my-project-nginx-app npm install --save-dev package-name
```

</details>

<details>
<summary><strong>🐘 Comandos Composer</strong></summary>

```bash
# Instalar paquete
docker exec -it my-project-nginx-app composer require vendor/package

# Actualizar dependencias
docker exec -it my-project-nginx-app composer update

# Dump autoload
docker exec -it my-project-nginx-app composer dump-autoload
```

</details>

---

## ⚙️ Análisis Técnico Profundo

### 🐳 Estrategia de Optimización Docker

Nuestro setup Docker utiliza **caché multi-capa** para lograr **builds 90% más rápidos**:

```dockerfile
# 1. Dependencias del sistema (rara vez cambian)
RUN apt-get update && apt-get install -y git curl zip...

# 2. Dependencias Composer (cambian cuando se actualiza composer.json)
COPY composer.json composer.lock ./
RUN composer install --no-scripts

# 3. Dependencias NPM (cambian cuando se actualiza package.json)
COPY package.json package-lock.json ./
RUN npm ci

# 4. Código de la aplicación (cambia frecuentemente)
COPY . .
```

**¿Por qué este orden?**
- 🚀 Docker reconstruye solo las capas modificadas
- ⏱️ Los cambios en el código no reconstruyen dependencias
- 💡 La iteración de desarrollo se vuelve súper rápida

### ⚡ Configuración Vite para Docker

```javascript
export default defineConfig({
    server: {
        host: '0.0.0.0',        // Permitir conexiones externas
        port: 5173,             // Puerto estándar
        watch: {
            usePolling: true,   // Requerido para volúmenes Docker
            interval: 1000,     // Intervalo optimizado
        },
        hmr: {
            host: 'localhost',  // Host HMR
            port: 5173,
        },
    },
});
```

**Optimizaciones clave:**
- 🔍 **usePolling: true** - Los volúmenes Docker necesitan polling para detectar cambios
- 🌐 **host: '0.0.0.0'** - Permite acceso desde fuera del contenedor
- ⚡ **interval: 1000** - Equilibra rendimiento con detección de cambios

---

## 🚨 Solución de Problemas

<details>
<summary><strong>❌ "Port 5173 is already in use"</strong></summary>

```bash
# Solución 1: Reiniciar contenedor
docker restart my-project-nginx-app

# Solución 2: Verificar procesos
docker exec my-project-nginx-app ps aux | grep vite

# Nota: El puerto se asigna automáticamente debido a strictPort: false
```

</details>

<details>
<summary><strong>❌ "Table 'sessions' doesn't exist"</strong></summary>

```bash
# Ejecutar migraciones (crea la tabla sessions automáticamente)
docker exec -it my-project-nginx-app php artisan migrate
```

**Por qué sucede esto:**
Laravel usa `SESSION_DRIVER=database` por defecto, requiriendo la tabla sessions.

</details>

<details>
<summary><strong>❌ Hot Reload no funciona</strong></summary>

```bash
# Verificar si Vite está ejecutándose
docker exec my-project-nginx-app ps aux | grep vite

# Verificar configuración
cat vite.config.js | grep usePolling  # Debería ser true

# Reiniciar Vite si es necesario
docker exec -it my-project-nginx-app npm run hot
```

</details>

<details>
<summary><strong>❌ Errores de permisos en storage</strong></summary>

```bash
# Arreglar permisos para storage de Laravel
docker exec -it my-project-nginx-app chmod -R 775 storage bootstrap/cache
docker exec -it my-project-nginx-app chown -R www-data:www-data storage bootstrap/cache
```

</details>

---

## 💡 ¿Por Qué Estas Decisiones Técnicas?

<table>
<tr>
<th>Decisión</th>
<th>Problema Resuelto</th>
<th>Beneficio</th>
</tr>
<tr>
<td><strong>NGINX sobre Apache</strong></td>
<td>Mejor rendimiento con conexiones concurrentes</td>
<td>Manejo superior de assets estáticos y SSL</td>
</tr>
<tr>
<td><strong>Caché de Capas Docker</strong></td>
<td>Rebuilds lentos (5-10 minutos)</td>
<td>Tiempo de build reducido a 30 segundos</td>
</tr>
<tr>
<td><strong>Vite usePolling</strong></td>
<td>Los volúmenes Docker no detectan cambios de archivos</td>
<td>Funcionalidad de hot reload perfecta</td>
</tr>
<tr>
<td><strong>MySQL 8.0</strong></td>
<td>Necesidad de características modernas de BD</td>
<td>Soporte JSON, window functions, mejor rendimiento</td>
</tr>
</table>

---

## 🎯 Flujo de Trabajo Recomendado

### 🌅 **Configuración Matutina**
```bash
docker compose up -d && docker exec -it my-project-nginx-app npm run hot
```

### 💼 **Durante el Desarrollo**
1. **Edita archivos** en tu IDE favorito
2. **Ve cambios instantáneamente** en https://localhost:8441
3. **Debuggea con Xdebug** cuando sea necesario
4. **Usa phpMyAdmin** para inspección de base de datos

### 🔧 **Aseguramiento de Calidad**
```bash
# Ejecutar tests
docker exec -it my-project-nginx-app php artisan test

# Análisis de código
docker exec -it my-project-nginx-app composer analyse

# Formatear código
docker exec -it my-project-nginx-app composer format
```

---

## 🛠️ Herramientas Recomendadas

<div align="center">

| Categoría | Herramienta | Propósito |
|-----------|-------------|-----------|
| **💻 IDE** | [PhpStorm](https://www.jetbrains.com/phpstorm/) / [VS Code](https://code.visualstudio.com/) | Edición de código |
| **🗄️ Base de Datos** | [TablePlus](https://tableplus.com/) / [Dbeaver](https://dbeaver.io/) | Gestión de BD |
| **🌐 Testing API** | [Postman](https://www.postman.com/) / [Insomnia](https://insomnia.rest/) | Desarrollo de APIs |
| **📊 Git GUI** | [GitHub Desktop](https://desktop.github.com/) / [Sourcetree](https://www.sourcetreeapp.com/) | Control de versiones |

</div>

---

## 🤝 Contribuciones

¡Las contribuciones son bienvenidas! Así es como puedes empezar:

1. **🍴 Hacer Fork** del repositorio
2. **🌟 Crear** una rama de funcionalidad: `git checkout -b feature/funcionalidad-increible`
3. **💾 Hacer Commit** de tus cambios: `git commit -m 'Agregar funcionalidad increíble'`
4. **📤 Push** a la rama: `git push origin feature/funcionalidad-increible`
5. **🔄 Abrir** un Pull Request

### 📋 Áreas para Contribuir

- 📚 Mejoras en documentación
- ⚡ Optimizaciones de rendimiento
- 🆕 Nuevas funcionalidades
- 🐛 Corrección de bugs
- 🧪 Cobertura de tests

---

## 📚 Recursos

<div align="center">

[![Laravel Docs](https://img.shields.io/badge/Laravel-Documentación-FF2D20?style=for-the-badge&logo=laravel&logoColor=white)](https://laravel.com/docs)
[![Docker Docs](https://img.shields.io/badge/Docker-Documentación-0db7ed?style=for-the-badge&logo=docker&logoColor=white)](https://docs.docker.com/compose/)
[![Vite Docs](https://img.shields.io/badge/Vite-Documentación-646CFF?style=for-the-badge&logo=vite&logoColor=white)](https://vitejs.dev/)
[![NGINX Docs](https://img.shields.io/badge/NGINX-Documentación-009639?style=for-the-badge&logo=nginx&logoColor=white)](https://nginx.org/en/docs/)

</div>

---

<div align="center">

**🚀 ¡Comienza a construir aplicaciones Laravel increíbles con confianza!**

*Este stack está optimizado para velocidad de desarrollo y listo para producción*

[![License: MIT](https://img.shields.io/badge/Licencia-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-bienvenidos-brightgreen.svg?style=for-the-badge)](http://makeapullrequest.com)

</div>
