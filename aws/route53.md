# Overview of Route 53

## What it is

1. Highly available and scalable Domain Name System (DNS) service
1. Three primary functions:

   1. Registering domain names
   1. Routing internet traffic to resources
   1. Checking health of resources

## Domain Registration and DNS Service

1. Route53 supports DNSSEC for domain registration but not for DNS services
1. Post domain registration, Route 53:
   1. Creates a hosted zone with same name as domain
   1. Assigns 4 name servers to hosted zone
   1. Adds name servers to the domain

## Domain Transfers

1. Not required to use other Route 53 features
1. Can only transfer domains that are supported at the top-level
1. You can't transfer a domain to Route 53 if the domain has a special or premium price.

## Routing Policies

Route53 supports the following types of routing policies:

1. Simple
   1. Route internet traffic to a single resource
1. Failover
   1. Configure active-passive failover?
1. Geolocation
   1. Route traffic based on location of users
1. Geoproximity
   1. Route traffic based on location of resources
1. Latency-based
   1. Route traffic to resource that provides best latency
1. Multivalue answer
   1. Respond to DNS queries with up to 8 healthy records selected at random
1. Weighted routing
   1. Route traffic to multiple resources in specified proportions

## Pricing

1. Pricing is based on three dimensions
   1. Managing hosted zones
      1. \$0.50 per hosted zone for first 25 zones
      1. \$0.10 per zone for additional
   1. Serving DNS queries
      1. Standard
         1. \$0.40 per million queries
         1. \$0.20 above 1B queries
      1. Latency-based
         1. \$0.60 per million queries
         1. \$0.30 above 1B queries
      1. Geo DNS
         1. \$0.70 per million queries
         1. \$0.35 above 1B queries
      1. Alias queries
         1. Free for alias records for AWS resources such as:
            1. Elastic load balancers
            1. Cloudfront distribution
            1. S3 buckets configured as website endpoints
   1. Managing domain names
      1. Annual charge for each domain registered or transferred into Route 53
         1. .com = \$12
         1. .co = \$25
         1. .in = \$15
         1. .mobi = \$12
         1. .org = \$12

## F.A.Q

1. What is DNS?
   1. Worldwide network of servers that help devices communicate
   1. Translates human readable domain names to machine readable IP addresses
1. What is a domain registrar?
   1. Administers human readable domain names
1. What is DNSSEC?
   1. Domain Name System Security Extensions
1. What is a subdomain?
   1. A domain name that has one or more labels prepended to the domain name
   1. Something like acme.example.com is a subdomain of example.com
   1. For purposes of SEO, treated as a separate site by Google
1. What is a name server?
   1. Servers in the DNS that help translate domain names to IP addresses
1. What is a hosted zone?
   1. Container for records
   1. What is a public hosted zone?
      1. Specify how to route traffic on the internet
   1. What is a private hosted zone?
      1. Specify how to route traffic inside VPC
1. What is a record or 'resource record set'?
   1. Object in a hosted zone used to define how to route traffic for the domain or a subdomain
   1. What is an 'alias record'?
      1. A type of record to route traffic to other AWS resources
1. What is a routing policy?
   1. Setting for records that determines how Route53 responds to DNS queries
