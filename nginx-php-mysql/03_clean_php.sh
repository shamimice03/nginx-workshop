#!/bin/bash

# Check if PHP is installed
if ! command -v php &>/dev/null; then
    echo "PHP is not installed."
    exit 1
fi

# Remove PHP and associated packages
sudo yum remove php php-cli php-fpm php-common php-json php-mysqlnd php-zip php-gd php-mbstring php-curl php-xml php-bcmath php-json php-opcache php-readline -y

# Remove PHP configuration files
sudo rm -rf /etc/php.d/ /etc/php-fpm.d/ /etc/php.ini

# Clean up any remaining PHP-related packages
sudo yum autoremove -y

# Verify that PHP is removed
if ! command -v php &>/dev/null; then
    echo "PHP has been removed from the system."
else
    echo "PHP removal may not have been completely successful."
fi
