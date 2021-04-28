# Postgres Overview

## What it is

1. Open-source enterprise-class relational database system
1. Modern versions support both SQL and JSON (non-relational) querying
1. Client-server based architecture

## Concepts

1. ACID
   1. Atomicity
   1. Consistency
   1. Isolation
   1. Durability
1. Transactions
   1. Set of actions fail or pass together
1. Database server
   1. A single server can manage many databases
1. Users
1. Databases
   1. Casts
   1. Catalogs
   1. Schemas
   1. Events
   1. Triggers
   1. Extensions
   1. Foreign Data Wrappers
   1. Languages
1. Tables
1. Triggers
1. Views
1. Functions
1. Domains
1. Sequences
1. psql
   1. Interactive terminal included with Postgres
   1. psql <database-name>
      1. defaults to user account name
1. pgAdmin
   1. GUI tool to access and manipulate a database
1. Superuser
1. Superuser password
1. Trust authentication
1. Default user is 'postgres'
1. Defaults
   1. user
   1. password
   1. database
1. initdb
1. Data directory
1. pg_ctl
   1. wrapper program to simplify some shell tasks

## Data Structures

## Popular Use Cases

## Building Paths

1. Transitioning from single master to cluster

# Running with Docker

1. Logging
1. Persistence with volumes
1. Networking
1. Custom configuration

## Key Commands

1. psql
   1. \q - quit
   1. \? - psql command help
   1. \h - sql command help
1. createdb
1. dropdb
1.

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
1. sequences
1. Locale
1. constraints
1. Indexes
1. RLS Policies
1. Rules
1. Triggers
1. Trigger Functions
1. Types
1. Views
1. Collations
1. Domains
1. FTS Configurations
1. FTS Dictionaries
1. FTS Parsers
1. FTS Templates
1. Foreign Tables
1. Functions
1. Materialized Views
1. Procedures

### Docker Questions

1. Working with volumes for data storage
1.
