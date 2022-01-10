# Zookeeper Overview

1. Open-source server to enable highly reliable distributed coordination
1. Version 3.0.0 released in 2008
1. Project of the Apache Software Foundation
   1. Originally a sub-project of Hadoop
1. Centralized service for maintaining configuration information, naming, providing distributed synchronization, and providing group services
1. Designed for storing small amounts of data (usually in kilobytes or low megabytes)
1. Does not perform well for write-dominant workloads
1. Ideal use is for coordination, where messages are exchanged between the clients

## Links

1. [Documentation](https://zookeeper.apache.org/doc/current/index.html)
1. [Wikipedia page](https://en.wikipedia.org/wiki/Apache_ZooKeeper)

## How it Works

1. [Explanation on StackOverflow](https://stackoverflow.com/questions/tagged/apache-zookeeper)
1. Operates as an ensemble of nodes/servers with a single master
   1. Master node is dynamically chosen by consensus within the ensemble
   1. when the master fails, the role of master migrates to another node
1. A client connects to one node of the ensemble at any given time
1. Writes
   1. Master is the authority for writes
   1. Guaranteed to be persisted in order i.e. linear
      1. => cannot have concurrent writes
1. Reads
   1. Zookeeper excels at reads
   1. Reads are concurrent
1. Zookeeper creates and maintains a shared hierarchical namespace of data registers (called znodes), similar to a filesystem
1. Provides high throughput, low latency, high availability, strictly ordered access to znodes
1. Replication over a set of machines allows for high availability
1. Data is maintained in-memory along with transaction logs and snapshots in a persistent store
1. Servers that make up the Zookeeper service must know about each other
1. Clients must also know the list of servers
1. As long as a majority of servers remain available, service remains available
1. All updates are **totally ordered**
   1. reads (and watches) are ordered with respect to updates

### Guarantees

## Terms

1. ensemble
   1. set of nodes/servers on which Zookeeper runs
1. znode = data register
1. zxid (Zookeeper transaction id)
1. read
1. write
1. watch
   1. clients can set a watch on a znode
   1. a watch will be triggered and removed when the znode changes

## Administration

### Setup

#### Docker

[Docker Hub Image](https://hub.docker.com/_/zookeeper)

```shell
docker pull zookeeper
```

Run zookeper within Docker

```shell
docker run --name some-zookeeper --restart always -d zookeeper
```

Connect to zookeeper from cli

```shell
docker run -it --rm --link some-zookeeper:zookeeper zookeeper zkCli.sh -server zookeeper
```

Connect to zookeeper from an application in another Docker container

```shell
docker run --name some-app --link some-zookeeper:zookeeper -d application-that-uses-zookeeper
```

Run with custom config

```shell
docker run --name some-zookeeper --restart always -d -v $(pwd)/zoo.cfg:/conf/zoo.cfg zookeeper
```

#### Ubuntu

[DigitalOcean Reference](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-an-apache-zookeeper-cluster-on-ubuntu-18-04)

#### Configuration

##### Production

1. Ensure data directory and transaction log directory are separate (default is for them to be the same)
   1. Throughput increases and latency decreases when transaction logs reside on dedicated log devices

#### Maintenance

1. Data directory cleanup
1. Debug log cleanup

### Tools

1. zkCleanup.sh
1. zkCli.sh
1. zkEnv.sh
1. zkServer-initialize.sh
1. zkServer.sh
1. zkSnapShotToolkit.sh
1. zkSnapshotComparer.sh
1. zkTxnLogToolkit.sh

## API

1. addWatch [-m mode] path # optional mode is one of [PERSISTENT, PERSISTENT_RECURSIVE] - default is PERSISTENT_RECURSIVE
1. create [-s] [-e] [-c] [-t ttl] path [data] [acl]
1. delete [-v version] path
1. deleteall path [-b batch size]
1. delquota [-n|-b|-N|-B] path
1. get [-s] [-w] path
1. getAcl [-s] path
1. getAllChildrenNumber path
1. getEphemerals path
1. ls [-s] [-w] [-R] path
1. set [-s] [-v version] path data
1. setAcl [-s] [-v version] [-R] path acl
1. setquota -n|-b|-N|-B val path
1. stat [-w] path
1. sync path

## Libraries

1. [Python](https://kazoo.readthedocs.io/en/latest/)
1. NodeJS:
1. GoLang:

## Log4J CVE

1. Zookeeper not affected as it uses Log4J v1.x

## Running in Production

### Things to avoid

1. Inconsistent list of servers across clients and Zookeeper servers
1. Incorrect placement of transaction log
   1. Ideal to keep transaction log on a separate device
   1. Consider increasing snapCount so that snapshot files are generated less often
1. Incorrect Java heap size
   1. Avoid situations where Zookeeper swaps to disk
   1. Set the Java max heap size to well below the limit that would lead to use of system swap
1. Public access
   1. Always place behind a firewall

## F.A.Q.

1. How much do I need to know about Zookeeper to use Kafka?
