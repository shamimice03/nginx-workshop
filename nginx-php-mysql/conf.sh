#!/bin/bash
set -x

SITE_ADDR="test.kubecloud.net"

# Create the nginx configuration file in /etc/nginx/conf.d/
cat <<EOF | sudo tee /etc/nginx/conf.d/test.conf
server {
    listen       80;
    server_name  ${SITE_ADDR}test.kubecloud.net www.${SITE_ADDR};

    access_log /var/log/nginx/${SITE_ADDR}access.log main;

    location / {
        root /var/www/html;
        index index.php;
    }

    error_page 404 /404.html;
    location = /404.html {
    }

    error_page 500 502 503 504 /50x.html;
    location = /50x.html {
    }

    location ~ \.php$ {
        root /var/www/html;  # files to be served
        include fastcgi_params;
        fastcgi_pass unix:/var/run/php-fpm/www.sock;  # Adjust to your PHP-FPM socket path
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }
}
EOF

# Reload Nginx to apply the new configuration
sudo nginx -s reload
