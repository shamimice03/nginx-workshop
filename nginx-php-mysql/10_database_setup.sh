#!/bin/bash

# Secrets
REGION="ap-northeast-1"
DBHostname="localhost"
DBPassword="Admin@123"
DBUser="admin"
DBName="testdb"

SQL_COMMANDS=$(cat <<-EOF
    CREATE DATABASE ${DBName};
    USE ${DBName};
    CREATE TABLE userinfo (
        username VARCHAR(255) PRIMARY KEY,
        user_address VARCHAR(255) NOT NULL,
        user_phone_number VARCHAR(20) NOT NULL
    );
EOF
)
# Check if the database exists
if mysqlshow -h localhost -u$DBUser -p$DBPassword | grep -q $DBName; then
    echo "Database '$DBName' already exists. Doing nothing."
else
    # Connect to the RDS instance and execute SQL commands
    mysql -h$DBHostname -u$DBUser -p$DBPassword -e "$SQL_COMMANDS"

    # Check if the SQL execution was successful
    if [ $? -eq 0 ]; then
         echo "Database '$DBName' created, and schema applied successfully."
    else
        echo "Error: Unable to create database or apply schema."
    fi
fi