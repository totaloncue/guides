# Postgres Overview

## Desired Features

1. Automatic failover + High availability
1. Guaranteed zero data loss
1. Read-only replicas

## What it is

1. Open-source enterprise-class relational database system
1. Modern versions support both SQL and JSON (non-relational) querying
1. Client-server based architecture

## Concepts

1. ACID
   1. Atomicity
      1. ALL statements that are part of a transaction pass or fail together as a unit
   1. Consistency
      1. Transactions can only move database from one valid state to another
   1. Isolation
      1. Concurrent execution of transactions = sequential execution of transactions
   1. Durability
      1. Guarantees once a transaction has been committed, will endure through failure
1. Service/server = instance of PostgreSQL daemon
   1. Database: each service houses many individual databases
      1. Schemas: next level of organization within a database
         1. 'public' schema automatically created for each new database
      1. Catalogs: system schemas that store PostgreSQL built-in functions and metadata
         1. each database born with:
            1. pg_catalog: functions, tables, views etc. packaged with PostgreSQL
            1. information_schema: ANSI standard views that expose PostgreSQL metainformation
   1. Variables
      1. part of Grand Unified Configuration (GUC)
      1. options that can be set at service, database and other levels
   1. Extensions
      1. package functions, data types, casts etc. for installation/removal as a unit
   1. Tables
      1. belong to schemas which belong to databases
      1. can have parents and children through inheritance!
      1. creating a table => auto-creating a custom accompanying data type that can then be used as a column in other tables!
   1. Foreign table and foreign data wrappers
      1. virtual tables linked to data outside a PostgreSQL database
      1. Foreign data wrappers = configuration for foreign tables
   1. Tablespace
      1. Physical location where data is stored
   1. Views
   1. Functions
      1. can return scalar value or set of records
      1. can also be used to manipulat data (stored procedures)
1. Users
1. psql
   1. Interactive terminal included with Postgres
   1. psql <database-name>
      1. defaults to user account name
1. initdb
1. Data directory
1. pg_ctl
   1. wrapper program to simplify some shell tasks
1. Login roles (users) and group roles (groups)
1. Template databases
1. search_path: similar to PATH in linux
1. Procedures
1. Checkpoints
1. Cursor
1. Two-phase commit
1. Domain
1. Event trigger
   1. Take action on specific database events
   1. Can act BEFORE, AFTER or INSTEAD of database event
   1. Row-level vs statement-level triggers
   1. Can be associated with a table, view or foreign table
1. Foreign table
1. Foreign data wrapper
1. Function
1. Group
1. Index
1. Materialized view
1. operator
1. Policy
1. Publication
1. Rule
1. Schema
1. Sequence
1. Foreign server
1. Subscription
1. Tablespace
1. Transform
1. Lock
1. Vacuum

## Patterns

1. Triggers 
1. Listen/notify
1. Caching with materialized views


## Key Commands

1. psql
   1. \q - quit
   1. \? - psql command help
   1. \h - sql command help
1. createdb
1. dropdb

## Authentication

1. When a client application connects to the Postgres server, the application specifies which Postgres database user name it wants to connect as
   1. Database user = role with the LOGIN privilege
1. Within the Postgres environment, the active database user name determines access privileges to database objects
1. Authentication is process by which server establishes identity of the client
1. Configuration file named pg_hba.conf stored in the database cluster's directory
   1. Default pg_hba.conf installed when data directory is initialized by initdb
   1. Set of records, one per line
      1. Each record specifies a connection type, client IP address range, database name, user name, auth method

## Database roles

1. Can be thought of as a single user or a group of database users depending on setup
1. Roles can own database objects and can assign privileges on those objects to other roles
1. Can also grant 'membership' in a role to another role
1. Database roles are GLOBAL
1. CREATE ROLE <name>;
1. DROP ROLE <name>;
1. createuser <name>
1. dropuser <name>
1. View set of existing roles by examining the pg_roles system catalog:
   1. SELECT rolname FROM pg_roles;
1. \du
1. While bootstrapping:
   1. Freshly initialized system always contains one predefined 'superuser' role
      1. By default will have the same name as the operating system user that initialized the database cluster

### Role attributes

1. LOGIN
1. SUPERUSER
1. CREATEDB
1. CREATEROLE

## psql commands

[Reference doc](https://www.postgresql.org/docs/13/app-psql.html)

### Command line parameters

1. -c <command> OR --command=<command>
   1. execute the given command string
1. -d <database>
1. -f <filename> OR --file=<filename>
   1. read commands from file
1. -h <hostname> OR --host=<hostname>
   1. hostname of the machine on which the database server is running
1. -l OR --list
   1. list available databases then exit
1. -L <filename> OR --log-file=<filename>
   1. write all query output into filename
1. -o <filename> OR --output=<filename>
   1. put all query output into filename
1. -p <port> OR --port=<port>
1. -q OR --quiet
1. -s OR --single-step
1. -S OR --single-line
1. -U <username> OR --username=<username>
1. -V or --version
1. -W or --password (force psql password prompt)

### MetaCommands

1. \c OR \connect [<dbname> <username> <host> <port>]
1. \conninfo
1. \db+
   1. list tablespaces
1. \dC+
   1. list type casts
1. \dt
   1. list available tables
1. \d+ <table-name>
   1. describe a table
1. \dn
   1. list schemas of currently connected database
1. \df
   1. list functions
1. \dv
   1. list views
1. \du
   1. list users and their roles
1. \h OR \help
1. \l+ OR \list+
   1. list available databases
1. \password
   1. alter password for current user
1. \s
   1. show command history
1. \i <filename>
   1. execute commands from a filename

## FAQ

1. What is the data directory?
   1. Default location for all Postgres data files
1. Database migrations
1. What is pg_dump?
1. template0 vs template1
   1. New enconding and locale settings can be specified when copying template0, whereas copies of template1 use the same settings as template1

## Running with Docker

1. Logging
1. Persistence with volumes
1. Networking
1. Custom configuration

### Docker working guide

1. How can I set up a custom postgresql.conf of pg_hba.conf file?
   1. Mount custom config files to required locations in container (e.g. /etc/postgresql)
      ile by mounting required file and changing startup command to include -c config_file=/path/to/mounted/file directive
1. How can I edit configuration file?
   1. Edit the mounted custom config file
   1. Issue a pg_ctl restart or pg_ctl reload depending on whether change needs a restart/reload
1. How can I edit an existing pg_hba.conf file?
1. How can I restart/reload the service?

   1. Log in to container as postgres user

   ```shell
   docker exec -it <container> su postgres
   pg_ctl restart/reload
   ```

### Docker Questions

1. Working with volumes for data storage

## F.A.Q.

1. Where are the PostgreSQL .conf files?
   1. [StackOverflow thread](https://stackoverflow.com/questions/3602450/where-are-my-postgres-conf-files)
1. How to log all PostgreSQL queries?
   1. [StackOverflow thread](https://stackoverflow.com/questions/722221/how-to-log-postgresql-queries)
1. How can I time queries in psql?
   1. [StackOverflow thread](https://dba.stackexchange.com/questions/3148/how-can-i-time-sql-queries-using-psql)
1. Where does PostgreSQL store the database
   1. [StackOverflow thread](https://stackoverflow.com/questions/1137060/where-does-postgresql-store-the-database)
1. How does JSONB work in PostgreSQL?
   1. [StackOverflow thread](https://stackoverflow.com/questions/22654170/explanation-of-jsonb-introduced-by-postgresql)
1. How can you ensure zero data loss with PostgreSQL?

## Comparison with RDS

### RDS Features

1. Automated backups
   1. Point-in-time-recovery for any second within the last 5 minutes
      1. Backs up database and transaction logs
      1. Automatic backup retention up to 35 days

## Sample data

[Reference](https://wiki.postgresql.org/wiki/Sample_Databases)

1. pgbench
1. pagila

## Backup and Recovery

1. pg_dump and pg_dumpall produce logical backups of a single point in time
1. pg_basebackup provides physical backup that can be combined with WAL archives to produce continuous point-in-time recovery
   1. Can also use EBS snapshots instead of pg_basebackup?

## Replication

### Streaming Replication

[Ubuntu guide](https://ubuntu.com/server/docs/databases-postgresql)

### Logical Replication

[Postgres Docs](https://www.postgresql.org/docs/13/logical-replication-quick-setup.html)
[DigitalOcean Guide](https://www.digitalocean.com/community/tutorials/how-to-set-up-logical-replication-with-postgresql-10-on-ubuntu-18-04)

1. Very simple to setup, uses pub-sub model
1. As of v13, can only replicate regular tables
   1. cannot replicate schema changes
   1. cannot replicate views, materialized views, partition root tables, foreign tables
1. Cascading logical replication can be set up
1. Supports multi-master models

#### Simple setup

1. Ensure 'wal_level' on publisher node = logical
1. Edit pg_hba.conf to allow replication e.g.

   ```shell
   host  all   repuser  0.0.0.0/0 md5
   ```

1. Grant privileges to replication user

   ```sql
   GRANT ALL PRIVILEGES ON DATABASE example TO repuser;
   GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO repuser;
   ```

1. Create publication on publisher node
1. Create subscription on subscriber node
   1. Ensure syncrhonous commit is set correctly on subscriber node

### Synchronous Replication

## Reload vs Restart

### Key Parameters that require a restart

1. wal_level
1. data_directory
1. config_file (can only be set on the command line)
1. hba_file
1. ident_file

## Ubuntu Working Guide

Installation references:
[Reference for latest version](https://www.postgresql.org/download/linux/ubuntu/)
[DigitalOcean Guide](https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart)
[pgDash guide](https://pgdash.io/blog/postgres-13-getting-started.html)

Default locations:

1. Data directory: /var/lib/postgresql/13/main
1. Config file: /etc/postgresql/13/main/postgresql.conf
1. HBA file: /etc/postgresql/13/main/pg_hba.conf
1. Log file: /var/log/postgresql/postgresql-13-main.log

pg_ctl vs pg_ctlcluster vs service
[Concise explanation](https://fatdragon.me/blog/2016/05/managing-postgresql-process-ubuntu-service-pgctl-and-pgctlcluster)
[StackOverflow question](https://askubuntu.com/questions/642259/stopping-a-postgresql-instance)

1. pg_ctlcluster is an Ubuntu-specific wrapper around pg_ctl i.e. it uses pg_ctl internally
   1. Can operate at individual cluster level
   1. service can only operate on all clusters together at one time

Post-installation setup:

1. Ensure 'listen_addresses' set appropriately in postgresql.conf
   1. Use scram-sha-256 for new database clusters
1. Check pg_hba.conf settings to allow all required connections
   1. Use scram-sha-256 for password encryption for new database clusters
1. Check firewall settings for instance
1. Create a regular database user

   ```shell
   SET password_encryption = 'scram-sha-256';
   CREATE ROLE regularuser LOGIN WITH PASSWORD 'password';

   ```

1. Create a regular database

   ```shell
   CREATE DATABASE app1 OWNER regularuser;
   ```

### Key commands

1. Use systemctl to take action on ALL clusters together

   ```shell
   sudo systemctl restart postgresql
   sudo systemctl reload postgresql
   sudo systemctl stop postgresql
   sudo systemctl start postgresql
   sudo systemctl status postgresql
   ```

1. Use ubuntu specific commands to take action on individual clusters

[Explanatory article](https://www.percona.com/blog/2019/06/24/managing-multiple-postgresql-instances-on-ubuntu-debian/)

```shell
pg_lsclusters
pg_createcluster [options] version name [--initdb options]
pg_ctlcluster
pg_dropcluster [--stop] cluster-version cluster-name
pg_wrapper
```

1. Remove a postgres installation completely

[Reference](https://askubuntu.com/questions/32730/how-to-remove-postgres-from-my-installation)

### Basic SQL reference

1. List all databases in a cluster
1. List tables in a database
1. Show schema of a table
1. Create a role
1. Create a database
1. Create a schema
1. Create a table
1. Insert records into a table
1. Retrieve records from a table
1. Query a table



