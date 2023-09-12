### Install `Telnet`
```
sudo yum install telnet -y
```

```bash
# telnet into the site
>> telnet dexter.kplabs.in 80
Trying 206.189.132.19...
Connected to dexter.kplabs.in.
Escape character is '^]'. 
# enter get request and then two enter 
GET /sample.html HTTP/1.1
Host: dexter.kplabs.in

HTTP/1.1 200 OK
Server: nginx/1.20.1
Date: Tue, 12 Sep 2023 07:27:55 GMT
Content-Type: text/html
Content-Length: 76
Last-Modified: Wed, 18 Oct 2017 05:19:43 GMT
Connection: keep-alive
ETag: "59e6e46f-4c"
Accept-Ranges: bytes

This is sample file.
Secially designed for your handwritten GET requests ;)
Connection closed by foreign host.
```