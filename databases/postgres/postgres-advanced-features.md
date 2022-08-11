# Postgres Advanced Features

1. Privileges
1. Row security policies
1. Table paritioning

1. Routines
   1. Collectively refers to functions and procedures

1. User-defined functions
   1. SQL functions
      1. Execute an arbitrary list of SQL statements, returning the result of the last query in the list
      1. Default is to return first row of last query but 'RETURNS TABLE(columns)' can be used to force function to return table
   1. Procedural language functions
   1. Internal functions
   1. C-language functions
   1. Eliminates multiple client-server round-trips even when executing a sequence of SQL functions
   1. Group a block of computation and SQL queries inside the database server => avoid round-trips

1. Stored procedures
   1. Offer additional functionality in comparison to functions

1. Trigger functions
   1. Can be written in a set of non-SQL languages (PL/pgSQL, PL/Tcl, PL/Perl, PL/Python, C)
   1. Create a trigger function separately from triggers themselves

1. Triggers
   1. Attached to a single table and capture only DML events
   1. Take action on specific database events
   1. Can act BEFORE, AFTER or INSTEAD of database event
   1. Row-level vs statement-level triggers
   1. Can be associated with a table, view or foreign table

1. Event triggers
   1. Different from regular triggers: Global to a particular database and can capture DDL events
   1. Supported events:
      1. ddl_command_start, ddl_command_end, table_rewrite, sql_drop

1. Procedural languages
   1. Must be installed into each database where they are to be used
   1. If installed into template1, evere subsequent database already has it included

