#!/bin/bash
set -x

REGION="ap-northeast-1"
DBHostname="localhost"
DBPassword="Admin@123"
DBUser="admin"
DBName="testdb"

mkdir /var/www/env
# create .env file inside /var/www/
echo DBHostname="$DBHostname" > /var/www/env/.env
echo DBUser="$DBUser" >> /var/www/env/.env
echo DBName="$DBName" >> /var/www/env/.env
echo DBPassword="$DBPassword" >> /var/www/env/.env

# Download and install Composer globally
sudo curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# dependency to read phpdotenv file
composer require vlucas/phpdotenv --working-dir=/var/www/html



