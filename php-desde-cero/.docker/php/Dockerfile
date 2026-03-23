# Usamos la misma imagen base
FROM php:8.3-apache

#Instalamos dependencias básicas y Composer
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    gnupg2 \
    curl \
    && rm -rf /var/lib/apt/lists/*

#copiamos el bin de composer para optimizar el peso
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 2. Instalamos los Drivers de Microsoft ODBC y las extensiones de PHP para SQL Server
# - Descargamos la llave GPG de Microsoft para verificar los paquetes.
# - Agregamos el repositorio oficial de Microsoft para Debian 12 (la base de php:8.3).
# - ACCEPT_EULA=Y acepta automáticamente los términos y condiciones de Microsoft (obligatorio).
# - pecl install compila las extensiones sqlsrv y pdo_sqlsrv.
# - docker-php-ext-enable las activa dentro de la configuración de PHP.
RUN curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /usr/share/keyrings/microsoft-prod.gpg \
    && curl -fsSL https://packages.microsoft.com/config/debian/12/prod.list | tee /etc/apt/sources.list.d/mssql-release.list \
    && apt-get update \
    && ACCEPT_EULA=Y apt-get install -y msodbcsql18 unixodbc-dev \
    && pecl install sqlsrv pdo_sqlsrv \
    && docker-php-ext-enable sqlsrv pdo_sqlsrv \
    && rm -rf /var/lib/apt/lists/*

# Habilitar mod_rewrite ( necesario para rutas amigables en .htaccess)
RUN a2enmod rewrite

# Copiar configuración personalizada de Apache
COPY .docker/php/conf.d/001-front-controller.conf /etc/apache2/conf-enabled/001-front-controller.conf

WORKDIR /var/www/html