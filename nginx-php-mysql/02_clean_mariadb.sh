#!/bin/bash
set -x

sudo systemctl disable mariadb
sudo systemctl stop mariadb
sudo yum remove mariadb-server mariadb-client mariadb -y
sudo yum autoremove -y
sudo yum clean all
sudo rm -rf /var/lib/mysql
sudo rm -rf /etc/my.cnf

echo "mariadb has been stopped, disabled, removed, and all associated files and configurations have been deleted."