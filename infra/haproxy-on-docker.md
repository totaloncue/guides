# HAProxy with Docker Overview

## References

1. [Docker Hub](https://hub.docker.com/_/haproxy)

## Check config file

```shell
docker run -it --rm --name haproxy-syntax-check -v /etc/haproxy:/usr/local/etc/haproxy:ro haproxy:alpine haproxy -c -f /usr/local/etc/haproxy/haproxy.cfg
```

## Running inside Docker Container with a bind mount

```shell
docker run -d --name <my-container-name> -v /path/to/etc/haproxy:/usr/local/etc/haproxy:ro haproxy:alpine
```

```shell
docker run -d --name docker-haproxy -v /etc/haproxy:/usr/local/etc/haproxy:ro haproxy:alpine
docker run -d --name docker-haproxy -v /home/ubuntu/docker-haproxy:/usr/local/etc/haproxy:ro -p 80:80 -p 443:443 haproxy:alpine haproxy -f /usr/local/etc/haproxy/haproxy.cfg
```

### Questions

1. What needs to be in the path to haproxy
   1. haproxy.cfg
   1. Any other directories that are referenced in the config file (e.g. certs, errors)
1. How do we conduct a graceful reload of HAProxy when config file changes

   ```shell
   docker kill -s HUP docker-haproxy
   ```

## Running inside Docker Container with SSL certificate support

1. Copy certs into a /certs folder inside /etc/haproxy folder
