# How to add SSL certificates to an EC2 instance

[Reference](https://certbot.eff.org/)

1. Below methodology does NOT work with static IPs provided by AWS
   1. Need to own a domain
1. In the DNS, add an A record for the domain pointing to the EC2 instance
1. SSH into the instance and use Certbot to automatically create an SSL certificate for the instance
1. Set up autoupdates as indicated by Certbot

[How to handle access to cert directory](https://stackoverflow.com/questions/48078083/lets-encrypt-ssl-couldnt-start-by-error-eacces-permission-denied-open-et)
[Reference 2](https://stackoverflow.com/questions/48755030/node-js-fs-cannot-read-certificate-from-letsencrpyt)
