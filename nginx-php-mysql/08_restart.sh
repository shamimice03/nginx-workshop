#!/bin/bash
set -x

sudo systemctl restart nginx
sudo systemctl restart php-fpm