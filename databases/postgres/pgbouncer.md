# pgbouncer Overview

## What it is

1. Lightweight connection pooler for PostgreSQL
1. pgbouncer acts as intermediary between clients and Postgres server
   1. Clients should connect to pgbouncer instead of connecting directly to Postgres server
1. Can be run on the database server or any other server (e.g. webserver)
1. Lower performance impact of opening new connections to PostgreSQL server

## Installation

1. pgbouncer versions are present in the Postgresql repositories
1. Fedora

```shell
dnf install pgbouncer
```

## Configuration

1. Sections:
   1. databases
      1. Defines databases that clients can connect to and how to route them
   1. pgbouncer
   1. users

## Usage

```shell
pgbouncer [OPTION]... CONFIG_FILE
```

## Authentication 

1. Clients to pgbouncer
   1. Supports TLS independent of TLS connection to Postgres
   1. Password auth
      1. List specified in userslists.txt file has authorized users with their passwords (can be hashed)
   1. hba
      1. Use a file similar to pg_hba.conf for path-based control
1. pgbouncer to Postgres
   1. Supports TLS connection independent of connection to Postgres

## Administration

1. A special pgbouncer database is created on the postgres server
1. Commands can be issued once connected to pgbouncer database as an admin_user as defined in config file
   1. User named pgbouncer can log in without password via Unix socket if client has same Unix user id as running process
1. Useful commands:
   1. SHOW STATS
   1. SHOW SERVERS
   1. SHOW CLIENTS
   1. SHOW POOLS
   1. SHOW USERS
   1. SHOW DATABASES
   1. SHOW CONFIG
   1. PAUSE [dB]
   1. DISABLE [dB]
   1. ENABLE [dB]
   1. RECONNECT [dB]
   1. KILL dB
   1. SUSPEND
   1. RESUME [dB]
   1. SHUTDOWN
   1. RELOAD
   1. WAIT_CLOSE [dB]
   1. SET key=arg

## Pool modes

1. Session-level
   1. Default mode
   1. Server connection assigned to client for entire duration the client stays connected
   1. Client disconnect => server connection returned to pool
   1. One-one completely transparent connections
1. Transaction-level pooling
   1. Server connection assigned to client ONLY during transaction
   1. Can imporeve throughput massively when many clients remain idle between queries
   1. Must be careful NOT to use session level variables as server connections are assigned at random to clients
1. Statement-level pooling
   1. Server connection returned to pool immediately after a query completes
   1. Multi-statement transactions are NOT supported in this mode

## References

1. [Scalegrid blog post](https://scalegrid.io/blog/postgresql-connection-pooling-part-1-pros-and-cons/)


## Gotchas

1. Need to clean connections before returning them to the pool
1. Auth is performed by pgbouncer instead of directly by postgres
   1. Replication connections cannot flow through pgbouncer

## Commands


