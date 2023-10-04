#!/bin/bash
set -e  # Exit immediately on error
set -x  # Print commands as they are executed

REGION="ap-northeast-1"
DBHostname="localhost"
DBPassword="Admin@123"
DBUser="admin"
DBName="testdb"

# Create the /var/www/env directory if it doesn't exist
mkdir -p /var/www/env

# Create a .env file inside /var/www/env
cat <<EOF > /var/www/env/.env
DBHostname="$DBHostname"
DBUser="$DBUser"
DBName="$DBName"
DBPassword="$DBPassword"
EOF

# Download and install Composer globally
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install the phpdotenv package for your project using the full path to Composer
/usr/local/bin/composer require vlucas/phpdotenv --working-dir=/var/www/html

echo "Script completed successfully."




