# Overview of keeepalived

## Useful References

1. [Article on HackerNoon about snaps](https://hackernoon.com/managing-ubuntu-snaps-the-stuff-no-one-tells-you-625dfbe4b26c)
1.

## What it is

1. Service to automatically migrate an IP address (or perform other activity) when failover detected in a master-slave arrangement
1. Each instance is aware of the other and periodically advertises/broadcasts itself to the other
   1. If the master fails and stops broadcasting to slave, then slave promotes itself to master and runs some appropriate activity
      1. What happens when the master recovers?
      1. What happens if a slave fails?

## Ubuntu working guide

Installation

```shell
sudo snap install keepalived --classic
sudo snap services
sudo snap stop keepalived
sudo snap start keepalived
sudo snap logs -f keepalived
```

## FAQ

1. max_auto_priority?
1. VIP specification needed?
1. Sending email on transition
1. Where are snap logs stored?
1. How can I work with multiple backups?
