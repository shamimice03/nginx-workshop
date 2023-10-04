#!/bin/bash
set -x

sudo yum install -y mariadb-server 
sudo systemctl enable mariadb
sudo systemctl start mariadb

RootPassword="password"
# Set Mariadb Root Password
sudo mysqladmin -u root password $RootPassword 

# MySQL credentials
REGION="ap-northeast-1"
DBHostname="localhost"
DBUser="admin"
DBPassword="Admin@123"

# Log in to MySQL as the root user and create the new user, grant privileges, and flush privileges
mysql -u root -p"${RootPassword}" -e "CREATE USER '${DBUser}'@'${DBHostname}' IDENTIFIED BY '${DBPassword}'; GRANT ALL PRIVILEGES ON *.* TO '${DBUser}'@'localhost'; FLUSH PRIVILEGES;"

echo "New user '${DBUser}' created with global privileges."

