# Kafka Overview

1. Ideal for event-based communication, where events are business facts that:
   1. have value to more than one service
   1. are worth storing
1. Designed for 'data in motion' as opposed to 'data at rest'
1. Primarily for real-time processing; secondary for long-term storage

## Terms

1. events => streams (events in motion) => topics (stream at rest)
1. clusters
1. data integrations
   1. clients
   1. connectors
1. streams application library
1. streaming database ksqlDB
1. schema registry
1. bootstrap server
1. topic
   1. category/feed name to which records are stored and published
   1. all kafka records are organized into topics
   1. producers write to topics
   1. consumers read from topics
1. partitions
   1. topics are divided into partitions
      1. more partitions => greater parallelization and throughput
1. retention policy
   1. retention time
      1. amount of time to retain data
   1. retention size (per partition)
      1. max size a partition can grow to before it is discarded
   1. cleanup policy
      1. delete
         1. discards old segments when retention time or size limit reached
      1. compact
         1. saves the last value for each unique key written to the topic
1. max message size
   1. default 2097164 bytes = 2MB
1. Configuration settings
   1. replication.factor
   1. min.insync.replicas
   1. cleanup.policy
   1. retention.ms
   1. retention.bytes
   1. max.message.bytes
   1. partitions
1. messages
   1. key/value pairs
      1. key commonly used for partitioning
      1. assures that records with same key are always written to the same partition
   1. key
   1. value
   1. header
   1. partition
   1. offset

## Sample messages by Datagen

1. clickstream
   1. topic
   1. partition
   1. offset
   1. timestamp
   1. timestampType
   1. headers
      [
      {
      "key": "task.generation",
      "stringValue": "0"
      },
      {
      "key": "task.id",
      "stringValue": "0"
      },
      {
      "key": "current.iteration",
      "stringValue": "942"
      }
      ]
   1. key: 233.245.174.233
   1. value
      {
      "ip": "233.245.174.233",
      "userid": 28,
      "remote_user": "-",
      "time": "9421",
      "\_time": 9421,
      "request": "GET /images/track.png HTTP/1.1",
      "status": "404",
      "bytes": "4006",
      "referrer": "-",
      "agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36"
      }

## F.A.Q.

1. At what scale do I need to use Kafka?
1. What is a minimal Kafka installation?
1. What is a Docker-based Kafka installation?
1. What is a connector?
   1. What is a transform?
   1. What is a predicate?
   1. What is a task in the context of a connector?
1. What is a schema registry?
1. Why are partitions needed?
   1. Mechanism for scalability and parallelization
   1. Allows for parallelization of topics across multiple brokers and multiple consumers in a consumer group can read in parallel
1. What are some recommendations on partitions?
   1. 10,000 partitions per cluster
   1. 10 partitions per topic
   1. #Partitions=Desired Throughput/Partition Speed
      1. Single partition ~= 10MB/s
1. What is a broker?
1. What is a consumer group and why is it useful?
   1. When a topic is consumed by consumers in the same group, every record/message will be delivered to only one consumer
   1. Can ensure parallel processing of records from a topic provide topic is split into partitions
1. What is 'dumb pipeline, smart clients'?
   1. Kafka brokers do NOT know about consumer offsets
   1. Consumers are in charge of tracking which records have been consumed
   1. Consumers store offset in a special topic called \_\_consumer_offsets after reading a record (committing the offset)
