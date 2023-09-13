### Install `php`
```bash
sudo amazon-linux-extras install -y  php7.2

sudo systemctl status php-fpm
sudo systemctl start php-fpm
sudo systemctl status php-fpm
```

### Findout `php-fpm` location:
```
>> /var/run/php-fpm/www.sock
```

### Nginx `conf`
```nginx
  server {
        listen       80;
        server_name  webapp1.kubecloud.net;
       
        access_log /var/log/nginx/webapp1.access.log main;

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
```

### Restart `nginx` and `php-fpm`
```bash
sudo systemctl restart nginx
sudo systemctl restart php-fpm
```
