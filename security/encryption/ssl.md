# Secure Sockets Layer (SSL)

[Cloudflare reference](https://www.cloudflare.com/en-gb/learning/ssl/what-is-ssl/)

1. Encryption-based internet security protocol
1. Developed at Netscape in 1995
1. Precursor to Transport Layer Security (TLS), which was first introduced in 1999
1. As of 2021, sometimes name used when actually referring to TLS due to name-recognition
1. Enables HTTP/2

## How it Works

1. First step is handshake between two devices to ensure both are who they claim to be (authentication)
1. Digitally signs data to provide data integrity

## Glossary

1. SSL/TLS certificate - a certificate similar to an ID card that proves someone is who they are
   1. Contains a website's public key
   1. Issued by 'Certificate Authorities' (CA)
1. Certificate Authority
   1. Responsible for issuing SSL/TLS certificates
   1. Can be public or private
1. Root certificate
1. Intermediate certificate
1. Leaf certificate
1. Certificate chain
1. SSL certificate types
   1. Single-domain
   1. Wildcard
   1. Multi-domain
1. SSL certificate validation levels
   1. Domain validation - proof of control of domain
   1. Organization validation - CA must establish direct contact with the person or business requesting certificate
   1. Extended validation - requires a full background check of the organization
1. Certificate Signing Request (CSR)
1. PCI
1. HTTP/2
1. Self-signed certificate
   1. Signed using private key of keypair
   1. No outside authority doing independent verification
1. Session keys
