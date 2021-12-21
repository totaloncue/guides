# OpenSSL Overview

## What it is

1. Robust, commercial-grade, full-featured toolkit for general-purpose cryptography and secure communications
1. Software library to secure communications over computer networks
   1. Against eavesdropping
   1. Identify the party at the other end
1. License is Apache-style -- does have some simple conditions over and above Apache

## Links

1. [OpenSSL Cookbook](https://www.feistyduck.com/books/openssl-cookbook/)
1. [SSL Labs](https://www.ssllabs.com/)

## Components

1. libssl - implementation of TLS protocols up to TLS v1.3
1. libcrypto - full-strength general purpose cryptography library
1. openssl
   1. command line tool
   1. 'swiss-army-knife' for cryptographic tasks, testing and analyzing
   1. Some uses:
      1. creation of key parameters
      1. creation of X.509 certs, CSRs and CRLs
      1. calculation of message digests
      1. encryption and decryption
      1. SSL/TSL client and server tests
      1. handling of s/MIME signed or encrypted email

## Commands

### Standard

### Message-digest

### Cipher

openssl@1.1 is keg-only, which means it was not symlinked into /usr/local,
because macOS provides LibreSSL

```shell
openssl version -a
```

OPENSSLDIR = where openSSL looks for default configuration and root certificates
