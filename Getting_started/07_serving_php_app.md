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

### Small Explanation:
The value of the `fastcgi_param SCRIPT_FILENAME` directive in your Nginx configuration snippet is used to specify the path to the PHP script that should be executed by PHP-FPM. In this case, it's constructed by combining the `$document_root` and `$fastcgi_script_name` variables.

- `$document_root`: This variable represents the root directory for your web server, which you've set as `/var/www/html`. It's where your web files are stored.

- `$fastcgi_script_name`: This variable holds the URI path of the PHP script being requested by the client.

So, the line `fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;` is telling PHP-FPM that the script to execute is located at the path formed by concatenating the document root and the URI path of the requested PHP script.

For example, if a client requests `http://yourdomain.com/some/path/to/script.php`, this directive would translate to: `fastcgi_param SCRIPT_FILENAME /var/www/html/some/path/to/script.php;`

This tells PHP-FPM to look for and execute the PHP script located at `/var/www/html/some/path/to/script.php`.
