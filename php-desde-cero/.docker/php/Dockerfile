FROM php:8.3-apache

# Dependencias del sistema
RUN apt-get update && apt-get install -y \
    unzip \
    curl \
    gnupg2 \
    apt-transport-https \
    libonig-dev \
    && rm -rf /var/lib/apt/lists/*

# Microsoft ODBC Driver 18 (requerido por sqlsrv)
RUN curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /usr/share/keyrings/microsoft-prod.gpg \
    && curl https://packages.microsoft.com/config/debian/12/prod.list \
        -o /etc/apt/sources.list.d/mssql-release.list \
    && apt-get update \
    && ACCEPT_EULA=Y apt-get install -y msodbcsql18 unixodbc-dev \
    && rm -rf /var/lib/apt/lists/*

# Extensiones PHP para SQL Server via PECL
RUN pecl install sqlsrv pdo_sqlsrv \
    && docker-php-ext-enable sqlsrv pdo_sqlsrv

# Extensiones PHP comunes 
RUN docker-php-ext-install \
    mbstring \
    mysqli \
    pdo_mysql

# mod_rewrite para URLs limpias
RUN a2enmod rewrite

WORKDIR /var/www/html	
