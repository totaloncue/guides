# Compute Engine Overview

## Features

1. Customizable instances
   1. 1-96 vCPUs (any even number within)
   1. Up to 8GB RAM per vCPU

## OS Login

## Defaults

1. Local users with passwords aren't configured on Linux VMs
1. Uses custom project and/or instance metadata to configure SSH keys and to manage SSH access
1. SSH keys stored in project metadata can access all VMs in project with these keys
1. SSH keys stored in instance metadata can access individual VMs
1. Manage access through metadata or OS Login
1. Can login names be customized?
1. What are labels?
1. What is instance metadata and how do I set it?
1. Fedora
   1. username=<email_id>
1. Debian
   1. username=<email_id>
1. Ubuntu
   1. username=<email_id>

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
1. Authentication is based on the private key but the key itself is never transferred through the network during authentication
   1. SSH verifies that the same person offering the public key also owns the matching private key
1. Authorized keys
1. Known hosts

## Connect to instances

### OS Login

### Connect with ssh

1. By default no persistent SSH keys generated for instances
   1. Connection based on temporary keys that are transferred to VM on each connection from console
1. [GCP docs](https://cloud.google.com/compute/docs/connect/create-ssh-keys)
1. Generate an ssh key pair (public key + private key)

```shell
ssh-keygen -t rsa -f ~/.ssh/KEY_FILENAME -C USER -b 2048
```

e.g.

```shell
ssh-keygen -t rsa -f ~/.ssh/test_key -C ubuntu -b 2048
```

1. Add public SSH key to instance metadata
1. Connect to instance
   1. For Fedora, use username 'core'
   1. For Debian and Ubuntu, use username provided with SSH file
