# Compute Engine Overview

## Features

1. Customizable instances
   1. 1-96 vCPUs (any even number within)
   1. Up to 8GB RAM per vCPU

## Instance Types by use-case

[Google Recommendation](https://www.gstatic.com/bricks/image/d25deab79c4a1f929fe61f943405e92e20c4a14ee16c91765c57e198bff289ab.svg)

1. Balanced, general-purpose = N2, N2D
   1. Enterprise apps
   1. Medium databases
   1. Web and app serving
1. Cost savings = E2
   1. Web serving
   1. Dev & Test environments
1. Scale-out, general purpose = TAU
1. Compute optimized = C2
   1. AAA GAming
1. Memory optimized = M2
   1. SAP HANA
   1. Largest in-memory databases
   1. Realtime data analytics
   1. In-memory cache
1. Accelerator optimized = A2
   1. ML
   1. HPC

## SSH

1. Cryptographic network protocol used to operate network services securely over an unsecured network
1. Uses a client-server architecture
1. Designed as a replacement for telnet
1. Introduced in 1995
1. Uses public-key cryptography
   1. Any person can encrypt a message using the intended receiver's public key
   1. Only the owner of the private key can then decrypt the message
1. Symmetric vs asymmetric crypto
   1. Symmetric => use same cryptographic key for both encryption and decryption
      1. => shared secret between two parties
   1. Common pattern is to use asymmetric encryption to exchange the secret for symmetric key encryption and then subsequently use symmetric keys
1. Authentication is based on the private key but the key itself is never transferred through the network during authentication
   1. SSH verifies that the same person offering the public key also owns the matching private key
1. Authorized keys
1. Known hosts

## Connect with ssh

1. Generate an ssh key pair (public key + private key)

```shell
ssh-keygen -t rsa -f ~/.ssh/KEY_FILENAME -C USER -b 2048
```

e.g.

```shell
ssh-keygen -t rsa -f ~/.ssh/test_key -C ubuntu -b 2048
```
