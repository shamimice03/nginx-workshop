#!/bin/bash

sudo amazon-linux-extras install -y  php7.2

sudo systemctl status php-fpm
sudo systemctl start php-fpm
sudo systemctl status php-fpm