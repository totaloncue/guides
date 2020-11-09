# Overview of HAProxy

## References

1. [HAProxy docs](https://cbonte.github.io/haproxy-dconv/2.3/configuration.html#4.1)
1. [DigitalOcean Concepts Guide](https://www.digitalocean.com/community/tutorials/an-introduction-to-haproxy-and-load-balancing-concepts)
1. [HAProxy with LetsEncrypt SSL on CentOS7](https://www.digitalocean.com/community/tutorials/how-to-secure-haproxy-with-let-s-encrypt-on-centos-7)

## What it is

1. High-Availability Proxy
1. High-performance, TCP/HTTP load balancer and proxy server

## Installation

1. Ubuntu 20

```shell
sudo add-apt-repository ppa:vbernat/haproxy-2.2
sudo apt update
sudo apt install haproxy
```

1. CentOS 7

For older versions:

```shell
sudo yum install haproxy
```

For newer versions, build from source:

1.  [Reference 1](https://www.unixmen.com/installing-haproxy-for-load-balancing-on-centos-7/)
1.  [UpCloud Reference](https://upcloud.com/community/tutorials/haproxy-load-balancer-centos/)

    1. Install required packages

    ```shell
    sudo yum install wget gcc pcre-static pcre-devel
    sudo yum groupinstall "Development Tools"
    sudo yum install openssl-devel
    ```

    1. Get the source code

    ```shell
     wget http://www.haproxy.org/download/2.2/src/haproxy-2.2.4.tar.gz -O ~/Packages/haproxy.tar.gz
    ```

    1. Build HAProxy with specific options for SSL

    ```shell
    cd ~/Packages
    tar xzvf ~/Packages/haproxy.tar.gz -C ~/Packages
    cd haproxy-2.2.4/
    make TARGET=generic ARCH=native CPU=x86_64 USE_PCRE=1 USE_PCRE_JIT=1 USE_OPENSSL=1 USE_ZLIB=1 -j8
    sudo make install
    ```

    1. Create a symbolic link to allow running as normal user

    ```shell
    sudo ln -s /usr/local/sbin/haproxy /usr/sbin/haproxy
    ```

    1.  Copy relevant files to required locations

    ```shell
    sudo cp examples/haproxy.init /etc/init.d/haproxy
    sudo chmod 755 /etc/init.d/haproxy
    sudo systemctl daemon-reload
    sudo mkdir -p /etc/haproxy
    sudo mkdir -p /run/haproxy
    sudo mkdir -p /var/lib/haproxy
    sudo touch /var/lib/haproxy/stats
    ```

## Basic Concepts

1. Access Control Lists
1. Test some condition => perform an action based on test result
1. Backend
1. Set of servers that receive forwarded requests
1. Most basic form:
   1. Load balance algorithm to use
   1. List of servers and ports
1. Frontend
1. How requests should be forwarded to backends
1. Contains the following:
   1. A set of IP addresses and a port
   1. ACLs
   1. 'use_backend' rules
      1. Define which backend to use depending on which ACL condition is matched
      1. Can also include a default backend rule to handle every other case
1. Load balancing types
1. Layer 4 (Transport Layer) load balancing
   1. Forward based on IP range and port
1. Layer 7 (Application Layer) load balancing
   1. Can make use of content of user's request
   1. Can use this to run multiple apps under same domain and port
1. Load balancing algorithms
1. roundrobin
   1. selects servers in turns = default
1. leastconn
   1. selects server with least connections
1. source
   1. selects based on hash of source IP
      1. => ensures a user will connect to the same server each time
1. Sticky sessions
1. For applications that require a user connects to the same backend server each time
1. uses 'appsession' parameter in backend that requires it
1. Health checks
1. Determine if a backend server is available to process requests

### Configuration - Essential Sections and Keywords

1. Parameter sources
1. command-line arguments, take highest precedence
1. "globals" section, with following important keywords:
   1. ca-base
   1. chroot
   1. crt-base
   1. daemon
   1. description
   1. group
   1. user
   1. log
   1. pidfile
   1. setenv, resetenv, unsetenv, presetenv
   1. stats
   1. ssl-default-bind-ciphers
   1. ssl-default-bind-ciphersuites
   1. maxconn
   1. max-ssl-conn
1. "proxies" sections
   1. includes:
      1. defaults
      1. listen
      1. frontend
      1. backend
   1. Important keywords
      1. acl
         1. acl <aclname> <criterion> [flags] [operator] <value> ...
      1. balance
      1. bind
      1. compression
      1. cookie
      1. default_backend
      1. maxconn
      1. log
      1. mode
         1. mode { tcp|health|http }
      1. rate-limit-sessions
      1. redirect
      1. server
      1. stats
         1. stats auth <user:passwd>
      1. timeout client
      1. timeout connect
      1. timeout server
      1. use_backend

## Useful commands

1. service haproxy reload
   1. graceful reload when config changes
1. service haproxy restart
1. systemctl start/stop/status haproxy
1. sudo service haproxy configtest
1. haproxy -c -V -f /etc/haproxy/haproxy.cfg

## ACLs

1. Used to take actions based on content extracted from request, response or environment
1. Typical actions:
1. block a request
1. select a backend
1. add a header
1. No limit to number of ACLs
1. Format
1. acl <aclname> <criterion> [flags] [operator] [<value>] ...
1. Data returned by sample fetch methods can be of following types:
1. boolean
1. integer
1. IPV4 or IPV6 addresses
1. string
1. data block
1. Returned data can be matched against following data types:
1. boolean
1. integer or integer range
1. IP address/network
1. string (exact, substring, suffix, prefix, subdir, domain)
1. regular expression
1. hex block
1. Flags
1. -i: ignore case
1. -m: use a specific pattern matching method

### Useful ACL Keywords

1. path_beg -i /blog
1. path begins with /blog and ignores case
1. hrd(host) -i
1. src
1. src_port

## SSL Termination

1. References
1. [Overview](https://www.haproxy.com/blog/haproxy-ssl-termination/)
1. [Let's Encrypt and Ubuntu Guide](https://www.digitalocean.com/community/tutorials/how-to-secure-haproxy-with-let-s-encrypt-on-ubuntu-14-04)
1. Enabling SSL
1. Add the 'ssl' and 'crt' parameters to a bind line in a frontend section
   1. bind 10.0.0.3:443 ssl crt /etc/ssl/certs/mysite.pem
1. Redirecting from HTTP to HTTPS
1. [Good reference](https://www.haproxy.com/blog/haproxy-and-http-strict-transport-security-hsts-header-in-http-redirects/)
1. Add below to frontend section
   1. http-request redirect scheme https unless { ssl_fc }
1. Enabling HTTP Strict Transport Security (HSTS)
1. [Reference](https://www.haproxy.com/blog/haproxy-and-http-strict-transport-security-hsts-header-in-http-redirects/)
1. Add below to frontend section
   1. http-request redirect scheme https code 301 unless { ssl_fc }
   1. http-response set-header Strict-Transport-Security "max-age=16000000; includeSubDomains; preload;"

## Advanced Topics

1. Hitless reloads
1. Runtime API

## Sample config

```
# Globals section
global
        # max connections
        maxconn 50000

        # Logging settings
        log /dev/log    local0
        log /dev/log    local1 notice

        # chroot jail
        chroot /var/lib/haproxy

        # Stats settings and enable runtime API
        stats socket /run/haproxy/admin.sock mode 660 level admin expose-fd listeners
        stats timeout 30s

        # Special user and group
        # Ensure user can access relevant directories for SSL
        # https://stackoverflow.com/questions/48078083/lets-encrypt-ssl-couldnt-start-by-error-eacces-permission-denied-open-et
        user ubuntu
        group ubuntu

        # Run as daemon
        daemon

        # DigitalOcean guide
        # Max size of Diffie Hellman temp keys
        tune.ssl.default-dh-param 2048

        # # Default SSL material locations
        ca-base /etc/ssl/certs
        crt-base /etc/ssl/private

        # See: https://ssl-config.mozilla.org/#server=haproxy&server-version=2.0.3&config=intermediate
        ssl-default-bind-ciphers ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384
        ssl-default-bind-ciphersuites TLS_AES_128_GCM_SHA256:TLS_AES_256_GCM_SHA384:TLS_CHACHA20_POLY1305_SHA256
        ssl-default-bind-options ssl-min-ver TLSv1.2 no-tls-tickets

# Defaults section for proxies
defaults
        # Log settings
        # Use the log settings shown in global section
        log     global

        # Specify layer at which HAProxy operates
        mode    http
        # mode  tcp

        # Use a verbose format when logging
        option  httplog

        # Ignore null messages
        option  dontlognull

        # Timeout settings
        timeout connect 5000
        timeout client  50000
        timeout server  50000

        # Associate file contents to HTTP Error code
        errorfile 400 /etc/haproxy/errors/400.http
        errorfile 403 /etc/haproxy/errors/403.http
        errorfile 408 /etc/haproxy/errors/408.http
        errorfile 500 /etc/haproxy/errors/500.http
        errorfile 502 /etc/haproxy/errors/502.http
        errorfile 503 /etc/haproxy/errors/503.http
        errorfile 504 /etc/haproxy/errors/504.http

        # Enable insertion of the X-Forwarded-For header to requests sent to servers
        # This is very important -- allows servers to see actual source of traffic
        option forwardfor

        # Enable or disable HTTP connection closing on the server side
        option http-server-close

# Frontend for https requests
frontend https-front
        # Bind
        bind 172.31.25.154:80
        bind 172.31.25.154:443 ssl crt /etc/haproxy/certs/haproxytest.courtupapp.xyz.pem
        # bind haproxytest.courtupapp.xyz:80
        # bind haproxytest.courtupapp.xyz:443 ssl crt /etc/haproxy/certs/haproxytest.courtupapp.xyz.pem
        # bind :80
        # bind :443 ssl crt /etc/haproxy/certs/haproxytest.courtupapp.xyz.pem
        # bind *:80
        # bind *:443 ssl crt /etc/haproxy/certs/haproxytest.courtupapp.xyz.pem

        # Add a header to indicate the protocol to the server
        http-request add-header X-Forwarded-Proto https if { ssl_fc }
        http-request add-header X-Forwarded-Proto http unless { ssl_fc }

        # Redirect HTTP to HTTPS
        http-request redirect scheme https unless { ssl_fc }

        # HSTS
        # May not work with Postman but should work elsewhere
        # max-age is mandatory
        # 16000000 seconds is a bit more than 6 months
        http-response set-header Strict-Transport-Security "max-age=16000000; includeSubDomains; preload;"

        # ACLs
        acl letsencrypt-acl path_beg /.well-known/acme-challenge/
        acl url_blog path_beg /blog
        acl host_1 hdr(host) -i haproxytest.courtupapp.xyz
        acl host_1_www hdr(host) -i www.haproxytest.courtupapp.xyz
        acl host_2 hdr(host) -i haproxytest2.courtupapp.xyz

        # Backend usage rules
        use_backend letsencrypt-backend if letsencrypt-acl
        use_backend blog-backend if url_blog
        use_backend http-domain1 if host_1
        use_backend http-domain2 if host_1_www
        use_backend http-domain2 if host_2

        # Default backend
        default_backend http-domain1

# LetsEncrypt backend
# Ensure setup for renewal is correct
# https://www.digitalocean.com/community/tutorials/how-to-secure-haproxy-with-let-s-encrypt-on-ubuntu-14-04
backend letsencrypt-backend
        server letsencrypt 127.0.0.1:54321

# Test backend 1
backend http-domain1
        balance roundrobin
        server server1 0.0.0.0:3000 check
        server server2 0.0.0.0:3001 check

# Test backend 2
backend http-domain2
        balance roundrobin
        server server3 0.0.0.0:4000 check

# Test backend blog
backend blog-backend
        balance roundrobin
        mode http
        server blog1 0.0.0.0:13000 check

```
