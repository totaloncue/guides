# Overview of HAProxy

## References

1. [DigitalOcean Concepts Guide](https://www.digitalocean.com/community/tutorials/an-introduction-to-haproxy-and-load-balancing-concepts)
1. [HAProxy with LetsEncrypt SSL on CentOS7](https://www.digitalocean.com/community/tutorials/how-to-secure-haproxy-with-let-s-encrypt-on-centos-7)

## What it is

1. High-Availability Proxy
1. High-performance, TCP/HTTP load balancer and proxy server

## Basic Concepts

1. Access Control Lists
   1. Test some condition => perform an action based on test result
1. Backend
   1. Set of servers that receive forwarded requests
   1. Defined in the 'backend' section of HAProxy config
   1. Most basic form:
      1. Load balance algorithm to use
      1. List of servers and ports
1. Frontend
   1. How requests should be forwarded to backends
   1. Defined in the 'frontend' section of HAProxy config
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
