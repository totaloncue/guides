# Kafka Cluster Setup

## References

1. https://docs.confluent.io/platform/current/kafka/operations.html
1. https://www.conduktor.io/kafka/kafka-cluster-setup-overview
1. 

## Recommendations

1. Isolate Zookeeper and brokers on independent nodes
1. Do NOT use the same drives used for Kafka data with application logs or OS filesystem activity
1. Avoid Network Attached Storage (NAS)
1. Use XFS or ext4 filesystems
1. Use medium-to-large sized instances (somewhere in the range of 32-128GB RAM)
1. Increase file descriptor count to at least 100,000

## Steps

1. Download Kafka latest version
```shell
wget https://dlcdn.apache.org/kafka/3.2.0/kafka_2.13-3.2.0.tgz
```
1. Verify download
1. Extract downloaded Kafka
1. Start Zookeeper service
1. Start Kafka broker service

## Rolling restarts

## Backups

## Monitoring
