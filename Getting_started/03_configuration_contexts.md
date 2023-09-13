### `nginx.conf`:
```bash
# main context - without {} braces
user nginx;
...
...

# event context
# Defines how nginx handles connections at a general level

events{
    # `worker_connections` sets the maximum number of simultaneous connections that can be opened by a worker process.
    worker_connections 1024;
}

# http context
http{
    # Defines how to handle HTTP and HTTPs connections
    ...
}

# mail context
mail{
    ...
}
```