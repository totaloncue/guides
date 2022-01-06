# DNS Overview

1. What problem did it solve?
   1. Name to address translations were earlier stored in a single table on the hosts file of an operating system
      1. Did not scale, lots of collisions
1. Naming system to identify computers, services and resources on the internet or on IP networks
1. Hierarchical, decentralized
1. Resource records associate domain names with other forms of information
   1. Most common use = map human-friendly domain names to numerical IP addresses
1. Since 1985
1. Analogy to a phone book
   1. Different users can simultaneously receive different translations for the same domain name e.g. to facilitate proximal mapping
1. Developed as an alternative to individual HOSTS files on nodes in the ARPANET network
1. Invented by Paul Mockapetris
1. DNS Zones
1. Domain namespace
1. WHOIS
   1. Protocol for querying databases that store registered users or assignees of an internet resource
   1. Look up domains, people and other resources related to domains
1. Distributed database that follows the client-server model
   1. Nodes are called name servers
   1. Each domain has at least one authoritative DNS server
   1. Top of hierarchy served by 'root name servers'
   1. Authoritative name server => only gives answers to DNS queries from data configured by an original source
      1. Can be a primary or secondary (master/slave) server
1. Domain name resolution
1. Reverse DNS lookup
