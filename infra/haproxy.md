# Overview of HAProxy

## References

1. [HAProxy docs](https://cbonte.github.io/haproxy-dconv/2.3/configuration.html#4.1)
1. [DigitalOcean Concepts Guide](https://www.digitalocean.com/community/tutorials/an-introduction-to-haproxy-and-load-balancing-concepts)
1. [HAProxy with LetsEncrypt SSL on CentOS7](https://www.digitalocean.com/community/tutorials/how-to-secure-haproxy-with-let-s-encrypt-on-centos-7)

## What it is

1. High-performance, TCP/HTTP load balancer and proxy server
1. Can operate at layer 4 (TCP) or layer 7 (HTTP)
   1. In TCP mode, HAProxy simply forwards bidirectional traffic
   1. In HTTP mode, HAProxy analyzes the protocol and can interact with it in multiple ways
1. HAProxy is designed to isolate itself into a chroot jail during startup
   1. => cannot perform any file-system access

## Installation

### Without Docker

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

1. [Reference 1](https://www.unixmen.com/installing-haproxy-for-load-balancing-on-centos-7/)
1. [UpCloud Reference](https://upcloud.com/community/tutorials/haproxy-load-balancer-centos/)

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

   1. Copy relevant files to required locations

   ```shell
   sudo cp examples/haproxy.init /etc/init.d/haproxy
   sudo chmod 755 /etc/init.d/haproxy
   sudo systemctl daemon-reload
   sudo mkdir -p /etc/haproxy
   sudo mkdir -p /run/haproxy
   sudo mkdir -p /var/lib/haproxy
   sudo touch /var/lib/haproxy/stats
   ```

### With Docker (recommended)

```shell
docker pull haproxy:2.3-alpine
```

## Basic Concepts

1. Load balancing types
   1. Layer 4 (Transport Layer) load balancing
      1. Forward based on IP range and port
   1. Layer 7 (Application Layer) load balancing
      1. Can make use of content of user's request
      1. Can use this to run multiple apps under same domain and port
1. Frontend
   1. How requests should be forwarded to backends
   1. Contains the following:
      1. Bind instruactions for a set of IP addresses and ports
      1. Access Control Lists
         1. Test some condition => perform an action based on test result
      1. 'use_backend' rules
         1. Define which backend to use depending on which ACL condition is matched
         1. Can also include a default backend rule to handle every other case
1. Backends
   1. Set of servers that receive forwarded requests
   1. Most basic form:
      1. Load balance algorithm to use
      1. List of servers and ports
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

## Configuration - Essential Sections and Keywords

1. 3 major sources of parameters used in HAProxy configuration:
   1. command-line arguments, take highest precedence
   1. configuration files
   1. running process' environment

### Configuration file(s)

1. Consist of an ordered sequence of statements
   1. Order of statements matters
      1. Ordering of sections does not matter, but 'global' section must precede other sections
1. The file is divided into multiple sections, delimited by certain section keywords (e.g. global, defaults)
1. Supports strong quoting and weak quoting
   1. Strong quoting by surrounding single quotes => nothing inside is interpreted
   1. Weak quoting by surrounding double quotes => some interpretation allowed (e.g. environment variables by using the $ sign)
1. Environment variables are supported in a manner similar to Bourne shells

#### Sections

1. "globals" section
1. "proxies" sections
   1. includes:
      1. defaults
         1. sets defaults for all other sections that follow
         1. parameters are reset by next 'defaults' section
      1. frontend
         1. describes a set of listening sockets accepting client connections
      1. backend
         1. describes a set of servers to which the proxy will connect to forward incoming connections
      1. listen
         1. defines a complete proxy with its frontend and backend parts combined in one section

## ACLs (Access Control Lists)

1. Take actions based on content extracted from request, response or environment
   1. e.g. block a request, select a backend, add a header
1. No limit to number of ACLs
1. Format
   1. acl \<aclname> \<criterion> [flags] [operator] [\<value>] ...
1. Criterion = sample fetch method
   1. default test method is implied by specified sample fetch method
   1. Data returned by sample fetch methods can be of following types:
      1. boolean
      1. integer
      1. IPV4 or IPV6 addresses
      1. string
      1. data block
   1. Converters can be used to transform between data types
1. Returned data can be matched against following data types:
   1. boolean
   1. integer or integer range
   1. IP address/network
   1. string (exact, substring, suffix, prefix, subdir, domain)
   1. regular expression
   1. hex block
1. Flags
   1. -i: ignore case
   1. -f: load patterns from a file parsed as a single column file
   1. -m: use a specific pattern matching method
   1. -M: load file pointed to by '-f' like a map file i.e. file is parsed as a two-column file

### Useful ACL Keywords

1. path_beg -i /blog
   1. path begins with /blog and ignores case
1. hrd(host) -i
1. src
1. src_port

## Dynamic Configuration

### Runtime API

[Dynamic Scaling Reference](https://www.haproxy.com/blog/dynamic-scaling-for-microservices-with-runtime-api/)
[Dynamic Configuration Reference](https://www.haproxy.com/blog/dynamic-configuration-haproxy-runtime-api/)

1. Command Line Interface (CLI) available as a UNIX or TCP socket
1. Provides ability to configure HAProxy dynamically at runtime without the need to restart or reload the service

#### Setup inside configuration when using Docker

```shell
stats socket ipv4@127.0.0.1:9999 level admin
stats timeout 2m
```

#### Use socat to interact with Runtime API within Docker

1. Install socat

```shell
sudo apt install socat
```

Note that the version of socat in Ubuntu standard repositories does not support readline

```shell
echo "get map" | socat stdio tcp4-connect:127.0.0.1:9999
echo "<command>" | socat stdio tcp4-connect:127.0.0.1:9999
```

Example of command to watch stats

```shell
echo "show stat" | socat stdio tcp4-connect:127.0.0.1:9999 | cut -d "," -f 1-2,5-10,34-36 | column -s, -t
```

### Data Plane API

1. Modern REST API to fully configure HAProxy
   1. Dynamically add and configure frontends, backends and traffic routing logic
   1. Manage stick tables, update logging endpoints and create SPOE filters
   1. Almost entire configuration of load balancer can be configured using HTTP commands

### Hitless Reloads

[Guide](https://www.haproxy.com/blog/hitless-reloads-with-haproxy-howto/)

1. Triggered by sending a SIGURS1 signal to HAProxy process
1. Unbinds from listening ports but continues to process existing connections
1. Used for reload vs restart

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

## Sample config

```shell
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

## Outstanding Questions

1. How can a single HAProxy server handle multiple SSL certificates?
1. Can multiple HAProxy servers run on the same machine
1. What is the appropriate way to use chroot within Docker?
1. Filters

## Useful commands when running HAProxy standalone outside of Docker

1. service haproxy reload
   1. graceful reload when config changes
1. service haproxy restart
1. systemctl start/stop/status haproxy
1. sudo service haproxy configtest
1. Check configuration
   1. haproxy -c -V -f /etc/haproxy/haproxy.cfg

## Rate Limiting

[Reference](https://www.haproxy.com/blog/four-examples-of-haproxy-rate-limiting/)

Some types of rate limiting are as below:

1. Max connections

   1. Add 'maxconn' parameter to servers as required with optional 'timeout queue'

   Example:

   ```shell

   backend servers
      timeout queue 10s
      server s1 192.168.30.10:80 check  maxconn 30
   ```

1. Sliding window (e.g. 20 requests per client during the last 60 seconds)

   1. Create a stick table to store http_req_rate data over required time window
   1. Use http-request statement with http_req_rate parameter to track data in defined stick table
   1. Deny requests if tracked rate of requests exceeds limit

   Example:

   ```shell
   backend st_src_global

      # Key is IP, 100k objects to be stored, expiry is 2 minutes and tracked data is http_req_rate over 1 minute
      stick-table type ip size 100k expire 2m store http_req_rate(1m)

   frontend st_user

      # Track http requests in sticky counter 0 with key as src and table as st_src_global for all calls
      http-request track-sc0 src table st_src_global # Rate limit with a sliding time window
      http-request deny deny_status 429 if { sc_http_req_rate(0) gt 5 }
   ```

1. Fixed window

   1. Create a stick table to store http_req_cnt data
      1. http_request_cnt increments forever until reset (e.g. via Runtime API)
   1. Use http-request statement with http_req_cnt parameter to track data in defined stick table
   1. Deny requests if above limit
   1. Reset data using the runtime API as and when desired

1. Rate Limit by URL

   1. Create a stick table to store http_req_rate data
   1. Use a map file to store rate limits by URL: URL as key and rate limit for URL as value
   1. Use http-request set-var statements to set a variable corresponding to the rate limit for the specific URL and another for the actual request rate for the combination of IP address and URL
   1. Deny request if actual request rate variable higher than rate limit variable

   Example:

   ```shell
   backend st_base32_src_req_rate
      # Key is IP, 100k objects to be stored, expiry is 2 minutes and tracked data is http_req_rate over 1 minute
      stick-table type binary len 20 size 100k expire 2m store http_req_rate(1m)

   # Frontend for https requests
   frontend https-front
      # Track client by base32+src (Host header + URL path + src IP)
      http-request track-sc0 base32+src table st_base32_src_req_rate

      # Check map file to get rate limit for path
      http-request set-var(req.rate_limit)  path,map_beg(/usr/local/etc/haproxy/rates.map,20)

      # Client's request rate is tracked
      http-request set-var(req.request_rate)  base32+src,table_http_req_rate(st_base32_src_req_rate)

      # Subtract the current request rate from the limit
      # If less than zero, set rate_abuse to true
      acl rate_abuse var(req.rate_limit),sub(req.request_rate) lt 0

      # Deny if rate abuse
      http-request deny deny_status 429 if rate_abuse

   ```

1. Rate Limit by URL parameter

   1. Create a stick table that stores http_request_rate data over specified time period with a string as key

   Example:

   ```shell
   frontend website
      bind :80
      stick-table type string size 100k expire 24h store http_req_rate(24h)

      # check for token parameter
      acl has_token url_param(token) -m found

      # check if exceeds limit
      acl exceeds_limit url_param(token),table_http_req_rate() gt 1000

      # start tracking based on token parameter
      http-request track-sc0 url_param(token) unless exceeds_limit

      # Deny if missing token or exceeds limit
      http-request deny deny_status 429 if !has_token or exceeds_limit
      default_backend servers
   ```

## Stick Tables

[Introduction](https://www.haproxy.com/blog/introduction-to-haproxy-stick-tables/)

1. Fast in-memory storage for use by HAProxy
1. Primarily used to track user activity across requests, with use cases including:
   1. Sticky sessions i.e. stick a client to a particular server
   1. Collect metrics
   1. Rate limiting
   1. Bot protection
   1. Track data transferred on a per-client basis
   1. Make other decisions based on state
1. Key-value store with:
   1. Key = identifier tracked across requests (e.g. client IP)
   1. Values = counters that, mostly, are auto-calculated/incremented by HAProxy
1. Sample analyses using stick tables:
   1. API requests per API key in last 24 hours
   1. TLS distribution of clients
   1. If website has an embedded search field, what are the top search terms people are using
   1. Number of pages accessed by a client in a given time window
   1. Amount of data transferred in/out by a client in a given time window

### Use cases

1. Sticky sessions
   1. Associate a specific server with a client using some information about the client (e.g. IP address)
   1. Extremely useful if application sessions are stored in-memory on a server
1. Bot detection
   1. Request floods
   1. Brute force login attacks
   1. Vulnerability scanners
   1. Web scrapers
   1. Slow loris attacks
1. Metric collection
   1. Use the Runtime API to read and analyze stick table data from the command line

### Directive syntax

1. 'stick-table' directives can be defined in a frontend or backend
1. The directive defines how much storage a stick table should use, how long data should be kept, and what data is to be observed
1. Each frontend and backend can have only one attached stick table
1. Standard technique is to:
   1. define frontends and backends whose sole purpose is to store stick table
   1. then use that stick-table elsewhere using the 'table' parameter

#### Stick-table definition

Example format

```shell
   stick-table type <type> size <size> expire <expire-time> store <metric-to-store>
   stick-table type ip size 1m expire 10s store http_req_rate(10s)
```

1. type = class of data that is captured
   1. ip
   1. ipv6
   1. integer
      1. often used to store a client ID based on a cookie or header
   1. string
      1. commonly used for session IDs, API keys
   1. binary
      1. commonly used for combinations (e.g. IP + URL)
1. size = number of entries the table can store (e.g. 1 million)
1. expire = informs HAProxy when to remove a record/data
1. store = declares value to be saved
1. nopurge = instruct HAProxy to not remove entries if table is full
1. peers = mechanism to sync with other nodes

#### Tracking Data

1. A sticky counter is a variable that temporarily holds the key value to look up in the stick table

   1. [Reference](https://www.haproxy.com/documentation/hapee/latest/configuration/stick-tables/syntax/)
   1.

1. Post definition of a stick table, data can be tracked by using sticky counters 'sc0' to 'sc2'
1. The build time variable MAX_SESS_STKCTR is used to define the maximum number of sticky counters
   1. => if more sticky counters needed, a special HAProxy build will have to be used

```shell
backend st_src_global
    stick-table type ip size 1m expire 10m store http_req_rate(10m)

backend st_src_login
    stick-table type ip size 1m expire 10m store http_req_rate(10m)

backend st_src_api
    stick-table type ip size 1m expire 10m store http_req_rate(10m)

frontend fe_main
    bind *:80
    http-request track-sc0 src table st_src_global
    http-request track-sc1 src table st_src_login if { path_beg /login }
    http-request track-sc1 src table st_src_api if { path_beg /api }
```

Example format

```shell
http-request track-sc0 <key> [table <table>] [ { if | unless } /<condition> ]
```

1. In format above:

   1. key = mandatory sample expression
   1. table = optional, defaults to stick-table declared in current proxy

1. General purpose counters (gpc)
1. General purpose tags (gpt)

### Memory considerations

1. Each stick table entry takes ~50 bytes for housekeeping + size of key + size of counters = total

## Bot Protection

[Reference](https://www.haproxy.com/blog/bot-protection-with-haproxy/)

1. Anti-scraping
   1. Bot behaviour pattern
      1. Browse a lot of unique pages very quickly
   1. Mitigation strategy
      1. Observe the number of requests each client is making
      1. Check how many of above requests are for pages client is visiting for the first time
      1. If rate of requests above a threshold:
         1. Flag user
         1. Deny new requests/route to a new backend
1. Brute-force bots
   1. Bot behaviour Pattern
      1. Bots that attempt to brute-force a login page
      1. Bots make POST requests and hit the same login URL repeatedly
   1. Mitigation strategy
      1. Track number of hits on relevant URL from each client
      1. Block clients that cross some threshold rate of hits in a given time window
1. Vulnerability Scanners
   1. Bot behaviour pattern
      1. Generic scanners that probe site for many different paths looking for known vulnerable, third-party apps
   1. Mitigation strategy
      1. First line of defence is a Web Application Firewall (WAF)
         1. [AWS example](https://aws.amazon.com/waf/)
         1. Protect web apps and APIs against common web exploits and bots
      1. In addtion, use stick tables and ACLs to detect and block vulnerability scanners
         1. Typical behaviour of vulnerability scanners = attempt to access paths that do NOT exist, which results in 404 errors to the requests
         1. Use 'http_err_rate' to measure the rate of errors per client
         1. Block clients that are above a certain error rate threshold
1. Whitelisting good bots
1. Geolocation

## Maps

[Introduction](https://www.haproxy.com/blog/introduction-to-haproxy-maps/)

1. A HAProxy map is a file that stores key-value pairs for use by HAProxy at runtime

Example of map file below:

```shell
# A comment begins with a hash sign
static.example.com  be_static
www.example.com     be_static

# You can add additional comments, but they must be on a new line
example.com         be_static
api.example.com     be_api
```

1. HAProxy uses map files as lookup tables
1. Two major benefits:
   1. Map files can be scanned very quickly for most use cases
   1. Map files can be changed dynamically at runtime
      1. Map files are loaded into memory when HAProxy starts and can be modified at runtime without a reload
1. A map 'converter' is a directive in the HAProxy config file that takes an input and provides an output based on a map file

   1. Example

   ```shell
   use_backend %[req.hdr(host),lower,map(/etc/hapee-1.8/maps/hosts.map,be_static)]
   ```

   1. Takes up to two arguments
   1. First is path to map file
   1. Second is an optional argument that defines a default if no matching key is found in map file

1. Map files can by dynamically edit at runtime, without causing disturbance to the HAProxy service by:
   1. Edit the file using the runtime API and also save changes to disk
   1. Editing the map file directly from disk and conduct a 'graceful/hitless reload' of HAProxy
   1. Use the 'http-request set-map' directive within the HAProxy config and update map entries based on URL parameters in the request
      1. Useful for making edits from a remote client

### Use Cases

1. Blue-green deployment
   1. Deploy a new release of app onto a set of staging servers and then swap them with production servers
1. Rate limiting by URL path

   Example map

   ```shell
   /api/routeA  40
   /api/routeB  20
   ```

   Example front end

   ```shell
   frontend api_gateway
    bind :80
    default_backend api_servers

    # Set up stick table to track request rates
    stick-table type binary len 8 size 1m expire 10s store http_req_rate(10s)

    # Track client by base32+src (Host header + URL path + src IP)
    http-request track-sc0 base32+src

    # Check map file to get rate limit for path
    http-request set-var(req.rate_limit)  path,map_beg(/etc/hapee-1.8/maps/rates.map)

    # Client's request rate is tracked
    http-request set-var(req.request_rate)  base32+src,table_http_req_rate(api_gateway)

    # Subtract the current request rate from the limit
    # If less than zero, set rate_abuse to true
    acl rate_abuse var(req.rate_limit),sub(req.request_rate) lt 0

    # Deny if rate abuse
    http-request deny deny_status 429 if rate_abuse
   ```
