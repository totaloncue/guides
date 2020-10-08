# Overview of Realtime DB

## Overview

1. Uses websockets/similar realtime tech
    1. Every time data changes, connected devices receive update within milliseconds
1. Offline capability as data is persisted to disk
1. No need for an app server

## Reading and Writing Data

1. set() to overwrite data, including child nodes, at a specified reference
1. on() and once() to read data at a path and to listen for changes
1. update() to write to specific children of a node without overwriting other child nodes
1. remove() to delete data at a particular reference
   1. Can also delete by update() with 'null'

## Working with Lists of Data

1. Use push() to append data to a list 
1. Listen for child events
    1. child_added
    1. child_changed
    1. child_removed
    1. child_moved
 1. Listen for value events

### Sorting and filtering data

1. Retrieve data sorted by key, value or value of a child

## Offline capabilities

## Data Structure

1. Database is a JSON tree
1. Data can be nested up to 32 levels deep but nesting is discouraged
1. Normalization is NOT best -- denormalization can be good

## Security and Rules

1. Four types
   1. read
      1. if and when data can be read by users
   1. write
      1. if and when data can be written
   1. validate
      1. defines what a correctly formatted value will look like
   1. indexOn
      1. specifies child to index to support ordering and querying
   1. 