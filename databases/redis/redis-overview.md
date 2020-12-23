# Redis Overview

## What it is

1. Redis='Remote Dictionary Server'
1. In-memory key-value database
1. Values can be different complex data structures, including:
   1. Strings
   1. Lists
   1. Sets
1. Beautiful, clear, small instruction set
1. Super-fast and super-small
1. Supports clusters that operate together in order to scale horizontally

## Concepts

1. Atomicity
   1. All Redis operations implemented by single commands are atomic
      1. => No need to think about concurrent access when using single commands
1. Persistence

   1. Two modes of persistence (AOF and RDB)
   1. General recommendation is to use both together
   1. AOF: logs every write operation
      1. Guaranteed to be more complete than RDB
      1. Very durable; minimizes data loss
   1. RDB: point-in-time snapshots of data at different intervals
      1. Compact, single-file representation of Redis data; great for backups
      1. Great for disaster recovery
      1. Maximizes Redis performance
      1. Faster restarts with bigger data sets in comparison to AOF
      1. Can lose data based on interval

1. Clusters
1. TTL and expiry
   1. Keys can be set to expire after a given amount of time. TTL = Time to live of key
1. Pipelines
1. Configuration
1. Security
   1. ACLs
1. Replication

## Data Structures

[Redis.io link](https://redis.io/topics/data-types-intro)

1. Binary-safe strings
1. Lists/linked lists
1. Sets
1. Hashes
1. Sorted Sets
1. Bitmaps
1. HyperLogLogs
1. Streams

1. Strings
1. Lists
   1. List of values with order of insertion maintained
   1. Values can be pushed from left or right
   1. Access at top/bottom is very fast
1. Sets
   1. Membership test is very fast
   1. A given element/value can exist only in one copy
   1. No guarantee that order of insertion is maintained
1. Sorted Sets
   1. Each element has an associated score and elements are sorted by their score
1. hashes
   1. maps between string fields and string values
   1. perfect structure to represent objects
1. HyperLogLogs
1. Streams
1.

## Popular Use Cases

1. Counters, using strings
1.

## Building Paths

1. Transitioning from single master to cluster

# Running with Docker

1. Logging
1. Persistence with volumes
   1. use flag '--appendonly yes' in docker run command
   1. Data is stored in /data folder of container
      1. Link this to a volume on host for persistence beyond container
1. Networking
   1. Redis within container is set to run on port 6379 of container
      1. Can be changed with a custom config file?
1. Custom configuration
   1. Mount volume with custom configuration to /usr/local/etc/redis/redis.conf within container
   1. Specify /usr/local/etc/redis/redis.conf in docker run command
1.
