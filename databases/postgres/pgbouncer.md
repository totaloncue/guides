# pgbouncer Overview

## What it is

1. Lightweight connection pooler for PostgreSQL
1. pgbouncer acts as intermediary between clients and Postgres server
   1. Clients should connect to pgbouncer instead of connecting directly to Postgres server
1. Can be run on the database server or any other server (e.g. webserver)

## Installation

1. Fedora

```shell
dnf install pgbouncer
```

1. From source

## Configuration

## Usage

```shell
pgbouncer [OPTION]... CONFIG_FILE
```

### Authentication 

1. Password auth
   1. List specified in userslists.txt file has authorized users with their passwords (can be hashed)
1. Passthrough auth

## References

1. [Scalegrid blog post](https://scalegrid.io/blog/postgresql-connection-pooling-part-1-pros-and-cons/)


## Gotchas

1. Clean connections before returning them to the pool
1. Auth is performed by pgbouncer instead of directly by postgres
   1. Replication connections cannot flow through pgbouncer

