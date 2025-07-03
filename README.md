# 🚀 Laravel Docker Development Stack

<div align="center">

**Production-ready Laravel development environment with Docker, NGINX, and modern tooling**

---

## 🌐 Documentation Languages | Idiomas de Documentación

<table align="center">
<tr>
<td align="center" width="50%">

### 🇺🇸 **English**
**📍 You are here** • *Estás aquí*

[![English Documentation](https://img.shields.io/badge/English-Documentation-blue?style=for-the-badge&logo=readme&logoColor=white)](README.md)

</td>
<td align="center" width="50%">

### 🇪🇸 **Español**
**🔗 Go to Spanish** • *Ir a Español*

[![Documentación en Español](https://img.shields.io/badge/Español-Documentación-red?style=for-the-badge&logo=readme&logoColor=white)](README.es.md)

</td>
</tr>
</table>

---

[![Docker](https://img.shields.io/badge/Docker-20.10+-0db7ed?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![Laravel](https://img.shields.io/badge/Laravel-12+-FF2D20?style=for-the-badge&logo=laravel&logoColor=white)](https://laravel.com/)
[![PHP](https://img.shields.io/badge/PHP-8.4-777BB4?style=for-the-badge&logo=php&logoColor=white)](https://php.net/)
[![Vite](https://img.shields.io/badge/Vite-6+-646CFF?style=for-the-badge&logo=vite&logoColor=white)](https://vitejs.dev/)
[![MySQL](https://img.shields.io/badge/MySQL-8.0-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://mysql.com/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16+-336791?style=for-the-badge&logo=postgresql&logoColor=white)](https://www.postgresql.org/)

</div>

---

## ✨ Features

<table>
<tr>
<td width="50%">

### 🏗️ **Core Stack**
- **PHP 8.4** with FPM optimization
- **Laravel 11** with full configuration
- **NGINX 1.28** with SSL support
- **MySQL 8.0** + **PostgreSQL 16**
- **Vite 6** with Hot Module Replacement
- **Tailwind CSS 4** for styling

</td>
<td width="50%">

### 🛠️ **Development Tools**
- **Xdebug 3** for debugging
- **phpMyAdmin** for MySQL management
- **pgAdmin** for PostgreSQL management
- **Hot Reload** with Vite dev server
- **SSL certificates** for HTTPS
- **Composer** and **npm** pre-installed

</td>
</tr>
</table>

---

## 🚀 Quick Start

### 🆕 First Time Setup

```bash
# Clone the repository
git clone <your-repository>
cd docker-laravel-nginx-mysql-postgres

# Build and start containers
docker compose up -d --build

# Run migrations (fixes sessions table error)
docker exec -it my-project-nginx-app php artisan migrate

# Generate application key (optional)
docker exec -it my-project-nginx-app php artisan key:generate
```

### 💻 Daily Development

```bash
# Start containers
docker compose up -d

# Start Vite with hot reload (keep terminal open)
docker exec -it my-project-nginx-app npm run hot

# Start coding! Access your app at https://localhost:8441
```

---

## 🌐 Service URLs

<div align="center">

| Service | URL | Credentials |
|---------|-----|-------------|
| **🌟 Laravel (HTTPS)** | https://localhost:8441 | - |
| **🌐 Laravel (HTTP)** | http://localhost:8001 | - |
| **📊 phpMyAdmin** | http://localhost:8081 | `adminmysqldocker` / `password_enviroment` |
| **🛠️ pgAdmin** | http://localhost:8082 | `admin@admin.com` / `admin123` |

</div>

---

### 📁 Project Structure

```
📦 docker-laravel-nginx-mysql-postgres/
├── 🐳 docker/
│   ├── 🌐 nginx/              # Web server configuration
│   │   ├── nginx.conf         # NGINX + SSL config
│   │   └── certs/             # SSL certificates
│   ├── 🐘 php/                # PHP container
│   │   ├── DockerFile         # PHP 8.4 + Node.js 22 + Xdebug
│   │   ├── php.ini            # Optimized PHP settings
│   │   └── xdebug/            # Debug configuration
│   ├── 🗄️ mysql/              # MySQL database
│   └── 🐘 postgresql/         # PostgreSQL database
├── 📄 docker-compose.yaml     # Service orchestration
├── ⚡ vite.config.js           # Vite configuration for Docker
├── 🔧 .env                    # Environment variables
├── 📦 package.json            # Node.js dependencies
└── 🎼 composer.json           # PHP dependencies
```

---

## 🎯 Common Commands

<details>
<summary><strong>🐳 Docker Commands</strong></summary>

```bash
# View container status
docker compose ps

# View real-time logs
docker compose logs -f app
docker compose logs -f nginx

# Enter PHP container
docker exec -it my-project-nginx-app bash

# Restart services
docker compose restart app
docker compose restart nginx

# Clean slate restart
docker compose down -v
docker compose up -d --build
```

</details>

<details>
<summary><strong>🎼 Laravel Commands</strong></summary>

```bash
# Database migrations
docker exec -it my-project-nginx-app php artisan migrate
docker exec -it my-project-nginx-app php artisan migrate:rollback
docker exec -it my-project-nginx-app php artisan migrate:fresh --seed

# Clear caches
docker exec -it my-project-nginx-app php artisan cache:clear
docker exec -it my-project-nginx-app php artisan config:clear
docker exec -it my-project-nginx-app php artisan view:clear

# Generate files
docker exec -it my-project-nginx-app php artisan make:controller ProductController
docker exec -it my-project-nginx-app php artisan make:model Product -m
docker exec -it my-project-nginx-app php artisan make:migration create_products_table
```

</details>

<details>
<summary><strong>⚡ Vite/Assets Commands</strong></summary>

```bash
# Development with hot reload
docker exec -it my-project-nginx-app npm run hot

# Production build
docker exec -it my-project-nginx-app npm run build

# Install new dependencies
docker exec -it my-project-nginx-app npm install package-name
docker exec -it my-project-nginx-app npm install --save-dev package-name
```

</details>

<details>
<summary><strong>🐘 Composer Commands</strong></summary>

```bash
# Install package
docker exec -it my-project-nginx-app composer require vendor/package

# Update dependencies
docker exec -it my-project-nginx-app composer update

# Dump autoload
docker exec -it my-project-nginx-app composer dump-autoload
```

</details>

---

## ⚙️ Technical Deep Dive

### 🐳 Docker Optimization Strategy

Our Docker setup uses **multi-layer caching** to achieve **90% faster builds**:

```dockerfile
# 1. System dependencies (rarely changes)
RUN apt-get update && apt-get install -y git curl zip...

# 2. Composer dependencies (changes when composer.json updates)
COPY composer.json composer.lock ./
RUN composer install --no-scripts

# 3. NPM dependencies (changes when package.json updates)
COPY package.json package-lock.json ./
RUN npm ci

# 4. Application code (changes frequently)
COPY . .
```

**Why this order?**
- 🚀 Docker rebuilds only changed layers
- ⏱️ Code changes don't rebuild dependencies
- 💡 Development iteration becomes lightning-fast

### ⚡ Vite Configuration for Docker

```javascript
export default defineConfig({
    server: {
        host: '0.0.0.0',        // Allow external connections
        port: 5173,             // Standard port
        watch: {
            usePolling: true,   // Required for Docker volumes
            interval: 1000,     // Optimized interval
        },
        hmr: {
            host: 'localhost',  // HMR host
            port: 5173,
        },
    },
});
```

**Key optimizations:**
- 🔍 **usePolling: true** - Docker volumes need polling for file changes
- 🌐 **host: '0.0.0.0'** - Enables access from outside container
- ⚡ **interval: 1000** - Balances performance with change detection

---

## 🚨 Troubleshooting

<details>
<summary><strong>❌ "Port 5173 is already in use"</strong></summary>

```bash
# Solution 1: Restart container
docker restart my-project-nginx-app

# Solution 2: Check processes
docker exec my-project-nginx-app ps aux | grep vite

# Note: Port auto-assigns due to strictPort: false
```

</details>

<details>
<summary><strong>❌ "Table 'sessions' doesn't exist"</strong></summary>

```bash
# Run migrations (creates sessions table automatically)
docker exec -it my-project-nginx-app php artisan migrate
```

**Why this happens:**
Laravel uses `SESSION_DRIVER=database` by default, requiring the sessions table.

</details>

<details>
<summary><strong>❌ Hot Reload not working</strong></summary>

```bash
# Check if Vite is running
docker exec my-project-nginx-app ps aux | grep vite

# Verify configuration
cat vite.config.js | grep usePolling  # Should be true

# Restart Vite if necessary
docker exec -it my-project-nginx-app npm run hot
```

</details>

<details>
<summary><strong>❌ Storage permission errors</strong></summary>

```bash
# Fix permissions for Laravel storage
docker exec -it my-project-nginx-app chmod -R 775 storage bootstrap/cache
docker exec -it my-project-nginx-app chown -R www-data:www-data storage bootstrap/cache
```

</details>

---

## 💡 Why These Technical Decisions?

<table>
<tr>
<th>Decision</th>
<th>Problem Solved</th>
<th>Benefit</th>
</tr>
<tr>
<td><strong>NGINX over Apache</strong></td>
<td>Better performance with concurrent connections</td>
<td>Superior handling of static assets and SSL</td>
</tr>
<tr>
<td><strong>Docker Layer Caching</strong></td>
<td>Slow rebuilds (5-10 minutes)</td>
<td>Build time reduced to 30 seconds</td>
</tr>
<tr>
<td><strong>Vite usePolling</strong></td>
<td>Docker volumes don't detect file changes</td>
<td>Perfect hot reload functionality</td>
</tr>
<tr>
<td><strong>MySQL 8.0</strong></td>
<td>Need for modern database features</td>
<td>JSON support, window functions, better performance</td>
</tr>
</table>

---

## 🎯 Recommended Workflow

### 🌅 **Morning Setup**
```bash
docker compose up -d && docker exec -it my-project-nginx-app npm run hot
```

### 💼 **During Development**
1. **Edit files** in your favorite IDE
2. **See changes instantly** at https://localhost:8441
3. **Debug with Xdebug** when needed
4. **Use phpMyAdmin** for database inspection

### 🔧 **Quality Assurance**
```bash
# Run tests
docker exec -it my-project-nginx-app php artisan test

# Code analysis
docker exec -it my-project-nginx-app composer analyse

# Format code
docker exec -it my-project-nginx-app composer format
```

---

## 🛠️ Recommended Tools

<div align="center">

| Category | Tool | Purpose |
|----------|------|---------|
| **💻 IDE** | [PhpStorm](https://www.jetbrains.com/phpstorm/) / [VS Code](https://code.visualstudio.com/) | Code editing |
| **🗄️ Database** | [TablePlus](https://tableplus.com/) / [Sequel Pro](https://www.sequelpro.com/) | Database management |
| **🌐 API Testing** | [Postman](https://www.postman.com/) / [Insomnia](https://insomnia.rest/) | API development |
| **📊 Git GUI** | [GitHub Desktop](https://desktop.github.com/) / [Sourcetree](https://www.sourcetreeapp.com/) | Version control |

</div>

---

## 🤝 Contributing

We welcome contributions! Here's how to get started:

1. **🍴 Fork** the repository
2. **🌟 Create** a feature branch: `git checkout -b feature/amazing-feature`
3. **💾 Commit** your changes: `git commit -m 'Add amazing feature'`
4. **📤 Push** to the branch: `git push origin feature/amazing-feature`
5. **🔄 Open** a Pull Request

### 📋 Areas for Contribution

- 📚 Documentation improvements
- ⚡ Performance optimizations
- 🆕 New features
- 🐛 Bug fixes
- 🧪 Test coverage

---

## 📚 Resources

<div align="center">

[![Laravel Docs](https://img.shields.io/badge/Laravel-Documentation-FF2D20?style=for-the-badge&logo=laravel&logoColor=white)](https://laravel.com/docs)
[![Docker Docs](https://img.shields.io/badge/Docker-Documentation-0db7ed?style=for-the-badge&logo=docker&logoColor=white)](https://docs.docker.com/compose/)
[![Vite Docs](https://img.shields.io/badge/Vite-Documentation-646CFF?style=for-the-badge&logo=vite&logoColor=white)](https://vitejs.dev/)
[![NGINX Docs](https://img.shields.io/badge/NGINX-Documentation-009639?style=for-the-badge&logo=nginx&logoColor=white)](https://nginx.org/en/docs/)

</div>

---

<div align="center">

**🚀 Start building amazing Laravel applications with confidence!**

*This stack is optimized for development speed and production readiness*

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=for-the-badge)](http://makeapullrequest.com)

</div>
