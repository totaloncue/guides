# Etcd Overview

1. Data backbone that keeps a distributed system running
1. Store configuration data for large-scale distributed systems
1. Implements the RAFT algorithm
1.

## Overview

1. Fully replicated
   1. Every node in an etcd cluster has access the full data store
1. Highly available
   1. designed to have no single point of failure and gracefully tolerate hardware failures and network partitions
1. Reliable consistent
   1. Every data ‘read’ returns the latest data ‘write’ across all clusters
1. Fast
   1. benchmarked at 10,000 writes per second
1. Secure
   1. supports automatic Transport Layer Security (TLS) and optional secure socket layer (SSL) client certificate authentication
1. Simple
   1. can read or write data to etcd using standard HTTP/JSON tools

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

## Setup

### Using Docker

1. Hosted on quay.io at https://quay.io/repository/coreos/etcd?tag=latest&tab=tags

## F.A.Q.

## Terms

## Links

1. [Core documentation](https://etcd.io/docs/v3.5/)
1. [IBM Cloud documentation](https://www.ibm.com/cloud/learn/etcd)

## Libraries

1. [Python]()
1. [NodeJS]()
1. [GoLang]()
