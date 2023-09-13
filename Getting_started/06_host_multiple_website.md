# Host Multiple Website
In this article, we will host two different website on one `nginx` server.

## Prerequisite

1. If `nginx` is running on `EC2` website. Attach an `Elastic IP` with the `EC2` instance.
2. Add `DNS` record on Route53. Example:
   - `webapp1.kubecloud.net` - `A record` - `EC2 IP (Elastic IP)`
   - `webapp2.kubecloud.net` - `A record` - `EC2 IP (Elastic IP)`
3. Security Group port `80` is open.

## Steps:
1. Create two different `.conf` file under `/etc/nginx/conf.d`


```nginx
#/etc/nginx/conf.d/webapp1.conf

server {
        listen       80;
        server_name  webapp1.kubecloud.net;
        
        location / {
        root /var/www/html;
        index test.html;
        }

        error_page 404 /404.html;
        location = /404.html {
        }

        error_page 500 502 503 504 /50x.html;
        location = /50x.html {
        }
}
```

```nginx
#/etc/nginx/conf.d/webapp2.conf

server {
        listen       80;
        server_name  webapp2.kubecloud.net;
        
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

2. Validate the `conf` file and `restart` the server:
```

sudo nginx -t

sudo systemctl restart nginx
```

