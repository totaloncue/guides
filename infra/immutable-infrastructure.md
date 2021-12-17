# Immutable Infrastructure Overview

## Tools to manage immutable infrastructure

1. Packer
1. Docker
1. Linuxkit (lkt)

## Implementation

1. Cloud environment
   1. Isolated instances
   1. Fast provisioning from custom images
   1. Automated management for creation and destruction via an API
1. Full automation of deployment pipeline
   1. Image creation
   1. Post-creation image validation
1. Service-oriented architecture
   1. Modular, logically discrete units that communicate over a network
1. Stateless, volatile application layer
1. Persistent data layer
   1. Centralized logging
   1. External data stores
      1. Databases
      1. Object storage

## FAQ

1. What is configuration drift?
   1. Change of configuration from expected/prescribed at creation time
   1. Inclusive of:
      1. Software on server
      1. Ports open on server
      1. Access to server
1. What are snowflake servers?
   1. A unique server with a configuration that is not easily replicable
1. How is configuration drift checked/avoided?
   1. Manual assessment and audit
   1. Compliance scans
   1. Monitor all systems in real-time
      1. As soon as a change is made that takes system out of compliance, a remediation process is initiated

## Articles

[DigitalOcean Overview](https://www.digitalocean.com/community/tutorials/what-is-immutable-infrastructure)
