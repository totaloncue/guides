# Etcd Overview

1. Data backbone for distributed systems
1. Implements the RAFT algorithm
1. etcd3 first released Jul 2016

## Links

1. [Core documentation](https://etcd.io/docs/v3.5/)
1. [IBM Cloud documentation](https://www.ibm.com/cloud/learn/etcd)
1. [Playground](http://play.etcd.io/home)

## Overview

1. Uses a multi-version concurrency control (MVCC) data model in version 3
1. Fully replicated
   1. Every node in an etcd cluster has access the full data store
1. Highly available
   1. designed to have no single point of failure and gracefully tolerate hardware failures and network partitions
1. Reliably consistent
   1. Every data ‘read’ returns the latest data ‘write’ across all clusters
1. Fast
   1. benchmarked at 10,000 writes per second
1. Secure
   1. supports automatic Transport Layer Security (TLS) and optional secure socket layer (SSL) client certificate authentication
1. Simple
   1. can read or write data to etcd using standard HTTP/JSON tools

### Data Model

1. Multi-version persistent key-value store
   1. Preservers the previous value of a key when value superseded with new data
   1. Effectively immutable; operations always generate a new updated structure
   1. All past versions of keys are **still** accessible and watchable after modification
1. Compaction sheds oldest versions of superseded data
1. Logical view is a flat binary key space
   1. Index = lexically sorted on byte string keys
1. Revisions
   1. When the store is created, revision is 1
   1. Each atomic mutative operation = increment key-space revision monotonically over lifetime of cluster
   1. Revisions are indexed => ranging over revisions with watchers is efficient
   1. Compaction => revisions before compact revision will be removed
1. Generations
   1. A key's life spans a generation (from creation to deletion)
   1. Each key has one or more generations
   1. Creating key => increment revision of key
   1. Deleting key => generate key tombstone, conclude key's current generation and reset version to 0
   1. Modify key => monotonically increase a version within a generation
   1. Compaction =>
      1. any generation ended before compaction will be removed
      1. values set before the compaction revision except the latest one will be removed

## Features

1. Concurrency primitives
   1. Lock RPCs
   1. Election RPCs
   1. command line locks
   1. command line elections
   1. recipes
1. Linearizable reads
1. Multi-version concurrency control
1. Transactions
   1. Field compares
   1. Read
   1. Write
1. Change notification
   1. Historical and current key intervals
1. User permissions

## API v3 versus v2

1. API v3 (introduced in 2016) uses a different data model (flat key space) + gRPC instead of REST
1. v2 to be deprecated in future releases

## Administration

### Setup

#### Ubuntu

#### Using Docker

1. [etcd docs guide](https://etcd.io/docs/v3.5/op-guide/container/)
1. [Repository at quay.io](https://quay.io/repository/coreos/etcd?tag=latest&tab=tags)

##### Single node

1. Use host IP address when configuring etcd e.g.

```shell
NODE1=192.168.0.108
```

1. Configure Docker volume to store etc data

```shell
docker volume create --name etcd-data
DATA_DIR="etcd-data"
```

1. Run latest version

```shell
REGISTRY=quay.io/coreos/etcd
docker run \
  -p 2379:2379 \
  -p 2380:2380 \
  --volume=${DATA_DIR}:/etcd-data \
  --name etcd ${REGISTRY}:latest \
  /usr/local/bin/etcd \
  --data-dir=/etcd-data --name node1 \
  --initial-advertise-peer-urls "http://${NODE1}:2380" --listen-peer-urls http://0.0.0.0:2380 \
  --advertise-client-urls "http://${NODE1}:2379" --listen-client-urls http://0.0.0.0:2379 \
  --initial-cluster node1="http://${NODE1}:2380"
```

### Configuration

#### Tuning

1. [Tips on running](https://blog.px.dev/etcd-6-tips/)
   1. Utilize frequent compactions
   1. Frequently defrag disk when using HDD

## etcdctl

1. Defaults to etcdctl v2
1. Set ETCDCTL_API=3 to use v3 API

## API v2

1. Zookeeper-like datastore with directories etc.
   1. write
   1. read
      1. etcdctl ls
   1. update
   1. delete
      1. etcdctl rmdir

## API v3

1. key-value services = create, read, update, delete key-value pairs
   1. write
      1. etcdctl set [command options] <key> <value>
   1. delete
      1. etcdctl del [options] <key> [range_end]
      1. individual key
      1. range of keys
      1. all keys
         1. etcdctl del "" --from-key=true
   1. read
      1. individual key
      1. range of keys
   1. transactions
      1. atomic if/then/else construct
      1. group requests together in atomic blocks (then/else) based on contents of key-value store (if)
1. watch = asynchronously monitor changes to keys
1. lease = primitives for consuming client keep-alive messages
   1.
1. other
   1. stress

## F.A.Q.

1. Gotcha: data store when using API v2 different than when using API v3!!!

## Terms

1. generation
1. revision
1. stress

## Libraries

1. [Python etcd2](https://github.com/jplana/python-etcd)
1. [Python etcd3](https://github.com/kragniz/python-etcd3)
1. [NodeJS etcd3](https://www.npmjs.com/package/etcd3)
1. [NodeJS etcd2](https://www.npmjs.com/package/node-etcd)

## Use Cases

1. Service discovery
1. Health checks and heartbeat

## Recommendations

### Development

1. Use Docker containers to set up cluster/single-node

### Production

1. Should I run etcd directly or via Docker?
   1. Docker installation a breeze but may lead to complexity in working with TLS and other features
1. What client language/library should I use?
   1. Go is best as directly supported but => learning Go!
   1. Python is good
   1. Node is good
   1. Bash script with curl is OK but uses the gRPC gateway as an interface between gRPC and REST
      1. How does watching work with gRPC gateway?
         1. Seems to create a HTTP long connection
