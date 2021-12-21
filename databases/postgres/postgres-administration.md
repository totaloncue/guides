# Postgres Administration Overview

## Tools

1. psql
   1. command line interface for running queries
1. pgAdmin
   1. widely used free GUI tool
1. Adminer
   1. unified tool that can manage multiple relational databases

## Packaged Command Line Tools

1. pg_dump: backup all or part of a database
1. pg_dumpall: backup all databases on server to a single plain-text or plain-text SQL file
1. pg_restore: restore backup files created using pg_dump
1. psql: interactive operation with the server
   1. can also be used to run non-interactive or one-off commands

## Configuration files

Find location of major configuration files

```sql
SELECT name, setting FROM pg_settings WHERE category = 'File Locations';
```

1. postgresql.conf
   1. general settings like memory allocation, default storage location for new databases, location of logs etc.
1. postgresql.auto.conf
   1. created or rewritten whenever 'ALTER SYSTEM' command issued
   1. settings in this file override those in postgresql.conf
1. pg_hba.conf (HBA = host-based authentication)
   1. controls security
   1. dictates which users can log in to which databases
   1. which IP addresses or groups of addresses can connect
   1. which auth scheme to expect
1. pg_ident.conf
   1. maps an authenticated OS login to a PostgreSQL user

## Service restarts vs reloads

1. Restarting => terminates active connections
1. Reloading => keeps active connections alive

   ```shell
   pg_ctl reload -D <path_to_data_directory>
   ```

   OR login as a superuser and run following command

   ```sql
   SELECT pg_reload_conf();
   ```

## Managing connections and killing queries

1. Retrieve a list of recent connections and process IDs:

   ```sql
   SELECT * FROM pg_stat_activity;
   ```

1. Cancel all active queries on a connection

   ```sql
   SELECT pg_cancel_backend(<pid>);
   ```

1. Kill the connection

   ```sql
   SELECT pg_terminate_backend(<pid>);
   ```

1. Kill all connections belonging to a particular role:

   ```sql
   SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE usename = 'some_role';
   ```

## Post-installation basics

1. Create and configure a user to run Postgres
   1. Best practice to create a user named postgres
   1. Add PostgreSQL tools to PATH
   1. Add init scripts
1. Create a database instance
1. Deploy init scripts

## Users and Permissions

1. Accounts are represented as **roles**

   1. Roles that can log in are 'login roles' = users
   1. Roles that contain other roles are 'group roles' = groups
      1. Group roles typically not allowed to log in on their own
   1. Roles can be designated as **superusers**

1. Create login roles

   ```sql
   CREATE ROLE leo LOGIN PASSWORD 'king' CREATEDB VALID UNTIL 'infinity';
   ```

1. Create a superuser role

   ```sql
   CREATE ROLE regina LOGIN PASSWORD 'queen' SUPERUSER VALID UNTIL '2020-1-1 00:00';
   ```

1. Create a group role

   ```sql
   CREATE ROLE royalty INHERIT;
   ```

1. Add roles to a group role

   ```sql
   GRANT royalty TO leo;
   ```

## Extensions

1. Add-ons that can be installed to a specific Postgres database to extend functionality
   1. How does this work in the Docker image?
1. Install extensions on a need-to-have-basis in required databases
1. If an extension required across all databases, develop a template database with required extensions and derive other databases from template
1. See which extensions are installed in database

   ```shell
   SELECT name, default_version, installed_version, left(comment,30) As comment
   FROM pg_available_extensions
   WHERE installed_version IS NOT NULL
   ORDER BY name;
   ```

### Installing extensions

1. Download the extension and install onto server
   1. How to do this with the Docker image?
   1. Download binary files and library files and copy into bin and lib folders
   1. Copy script files into share/extension
1. Install the extension into database
   1. use the 'CREATE EXTENSION' command

### Popular extensions

1. btree_gist: GIST index operator classes
1. btree_gin: GIN index operator classes
1. postgis: spatial data
1. fuzzystrmatch: soundex, levenshtein and metaphone algorithms for fuzzy string matching
1. hstore: for key-value pair storage and index support
   1. mostly replaced with inbuilt jsonb type
1. pg_trgm(trigram): additional fuzzy string search library
1. pg_crypto: encryption tools
1. pgadmin?

## Best practices

1. Organize schemas by roles
   1. Handy for applications that must serve multiple clients whose data must be kept separate
1. Create schemas to house extensions separately from data
1. Backup globals on a daily basis using pg_dumpall
1. Backup databases individually using pg_dump
1. Backup at service level using pg_basebackup
1. pg_basebackup + streaming replication = fastest way to recover from major server failure

## Logfiles

## Replication and Performance Improvement

## Monitoring Postgres

## Indexing and Performance Tuning

## Backup and Recovery

1. Three bundled utilties to help with backups:
   1. pg_dump
      1. backup specific databases
      1. selectively backup databases, tables, schemas
      1. can backup to plain sql, TAR, directory formats
   1. pg_dumpall
      1. back up all databases in plain text
      1. comprehensive backup, includes server globals like tablespaces and roles
   1. pg_basebackup
      1. sytem-level disk backup of all databases
      1. full postgresql server cluster backup (useful for 500GB or more size)
1. Recover/restore using one of the following methods:

   1. Use psql to restore plain text backups generated with pg_dumpall or pg_dump
   1. Use pg_restore to restore compressed, TAR and directory backups created with pg_dump
      1. can perform parallel restores using multiple threads of execution
      1. backward compatible => restore backups from older versions of Postgres to newer versions

1. Three methodologies to backup:
   1. SQL dump
   1. File system level backup
   1. Continuous archiving

### SQL dump

1. Generate a file with SQL commands that, when fed back to the server, recreates the database in the same state as at time of dump
1. Uses pg_dump tool
1. Command: pg_dump **dbname** > **dumpfile**
1. Results can be written to stdout or piped to a file
1. Results can be plain-text files or other formats that allow for special features
1. Outputs can generally be re-loaded into newer versions of Postgres
1. Only method that works for moving to a new machine architecture
1. Dump represents a snapshot of the database at the time pg_dump started running
1. Does not block database operations
