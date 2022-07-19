# Overview of Kafka Design

## Videos

1. https://www.youtube.com/watch?v=j4bqyAMMb7o&list=PLa7VYi0yPIH0KbnJQcMv5N9iW8HkZHztH
1. https://www.youtube.com/watch?v=d3ZDUBFB91I&list=PLt1SIbA8guusxiHz9bveV-UHs_biWFegU&index=2
1. https://www.youtube.com/watch?v=RYC-7wECMds&list=PLa7VYi0yPIH14oEOfwbcE9_gM5lOZ4ICN

## Terms

1. Topics
   1. Fundamental unit of organization
   1. Named container for similar events
   1. Analogous to tables in databases
   1. Identified by name
   1. Contains messages
1. Partitions
   1. Topics are split into partitions
   1. Partitions are ordered
   1. Messages within a partition get an incremental id called offset
   1. Order is guaranteed only within partitions
   1. Messages sent randomly to partitions with management by Kafka
      1. Messages with a key are all sent to the same partition
1. Partition leader
   1. At any time, one broker is leader for partition
   1. Only leader can receive and serve data for a partition
1. Leader election
1. In-sync replica (ISR)
1. Producers
1. Consumers
   1. Consumer groups
      1. Each consumer within a group reads from exlusive partitions
      1. Cannot have more consumers than partitions
   1. Consumer offsets
      1. Kafka stores offsets at which a consumer group has been reading
1. Cluster
1. Brokers
   1. Same as a server?
   1. Each broker identified with integer ID
   1. Each broker contains certain topic partitions
   1. Bootstrap broker = broker that client initially connects to
1. Replication factor 
   1. Usually between 2-3
   1. Can be configured on topic basis?
1. Extended API
   1. Kafka Connect
   1. Kafka Streams
   1. Kafka Mirror Maker

