```nginx
...
http{
    ...
    include /etc/nginx/conf.d/*.conf;
}
```
## Explanation: 
`include /etc/nginx/conf.d/*.conf;`: This line includes all configuration files with the ".conf" extension located in the "/etc/nginx/conf.d/" directory. The asterisk (*) is a wildcard character, indicating that any file ending in ".conf" in that directory will be included. This is a common practice in Nginx configuration to modularize and organize configuration settings into separate files for easier management and maintenance.


---

Now, lets create a `custom.conf` file under the `/etc/nginx/conf.d` directory:
```nginx
  server {
        listen       80;
        server_name  localhost;

        access_log /var/log/nginx/host.access.log main;

        location / {
        root /usr/share/nginx/html;
        index index.html;
        }

        error_page 404 /404.html;
        location = /404.html {
        }

        error_page 500 502 503 504 /50x.html;
        location = /50x.html {
        }
 }
```