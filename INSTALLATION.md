# INSTALLATION

### Approach 1:
```bash
yum install nginx
systemctl start nginx
systemctl enable nginx
nginx -V
```

### Approach 2 (Recommended):

Documentation Referred:

https://www.nginx.com/resources/wiki/start/topics/tutorials/install/

```bash
yum -y install wget
wget https://nginx.org/packages/centos/8/x86_64/RPMS/nginx-1.20.1-1.el8.ngx.x86_64.rpm
yum install nginx-1.20.1-1.el8.ngx.x86_64.rpm
systemctl start nginx
systemctl enable nginx
nginx -V
```

### AmazonLinux2
```bash
sudo amazon-linux-extras install nginx1 -y
sudo systemctl start nginx
sudo systemctal enable nginx
```
