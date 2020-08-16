# Overview of Cloudfront

## What it is

1. Worldwide content delivery network to speed up distribution of static and dynamic content

## How it works

1. Implemented through network of data centers called edge locations
1. Users are routed to edge location with lowest latency
   1. If content already at edge location, Cloudfront immediately delivers
   1. If content not at location, Cloudfront retrieves from an origin defined as source of definitive version of content
1. Routes each request through the AWS backbone network

## Origin 'servers'

1. Can be an S3 bucket or an HTTP server on EC2
1. Stores the original, definitive version of objects
1. Files are uploaded to origin servers
1. A CloudFront 'distribution' is then created
1. CloudFront assigns a domain name to the distribution
   1. Optionally, can assign own domain name to distribution
1. Distro's config sent to all Points of Presence (PoPs)
1. Use the CloudFront domain in applications

### Caching

1. Default cache time at edge location = 24 hrs
1. Minimum = 0; maximum = undefined

## Lambda@Edge

1. Can run Lambda functions closer to the user
1. Runs code in repsonse to events genereated by CloudFront
1. Costs are ~3x normal Lambda pricing
1. Some constraints apply:

   1. Only Node and Python
   1. Env variables, Dead Letter Queue and Amazon VPCs cannot be used

## Pricing

1. Charges are incurred as below:
   1. Data Transfer Out To Internet
      1. Varies by region from $0.085 per GB in US to $0.17 per GB in India
      1. For low data transfer, CloudFront data transfer cost same as EC2/S3 in US but much higher (60%) in India
      1. For high data transfer, CloudFront lower cost than EC2/S3 in US but still more expensive (double) in India
   1. Data Transfer Out to Origin
      1. Ranges from $0.02 per GB in US to $0.16 per GB in India
   1. Data trasnfer from origin server to CloudFront
      1. Free for "orogin fethces"
   1. HTTP/HTTPS Requests
      1. HTTP: ranges form $0.75 per Million requests in US to $0.9 per million in India
      1. HTTPS: ranges from $1.00 per million requests in US to $1.20 per million in US
   1. Invalidation requests
   1. Field level encryption requests
   1. Dedicated IP Custom SSL Certs
   1. Lambda@Edge pricing
      1. Requests: \$0.60 per million requests
         1. 3x normal Lambda pricing
      1. Duration: $0.00000625125 for every 128MB-second => $16.74 for every 128MB-month
         1. 3x normal Lambda pricing
      1. Note: Normal Lambda is ~5x cost of running a full a1 type machine in a single region

## Other