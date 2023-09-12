# Validation

Run following command after making any change in the `/etc/nginx/nginx.conf` file:
```bash
sudo nginx -t -c /etc/nginx//nginx.conf
```

```bash
>> sudo nginx -t -c /etc/nginx//nginx.conf

nginx: the configuration file /etc/nginx//nginx.conf syntax is ok
nginx: configuration file /etc/nginx//nginx.conf test is successful
```