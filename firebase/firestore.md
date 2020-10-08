# Overview of Cloud Firestore

1. [Mongo vs Firestore](https://www.mongodb.com/firebase-vs-mongodb)

## Data model

1. NoSQL Document-oriented database somewhat similar to MongoDB
1. Each document is a collection of key-value pairs
1. Optimized for storing large collections of small documents
1. Documents must be stored in collections
   1. Documents can contain subcollections and nested objects
1. Documents limited in size to 1 MB
1. Supports a large number of primitive data types including arrays and maps

## Indexes

1. ALL queries are index-backed
    1. A query that does not have an index to support will return an error
1. Two types:
    1. Single-field indexes
       1. Sorted mapping of all documents in a collection that contain a specific field
       1. Automatically generates single-field indexes for each field in a document and each sub-field in a map(!)
          1. Explicit exemptions can be made
    1. Composite indexes
       1. Sorted mapping of all documents based on ordered list of fields to index

## Manage Data

1. set() to overwrite or merge with existing document
1. add() to add documents without a specific id
   1. use doc() to generate a reference to the specific document Id
1. update() to update documents
    1. use arrayUnion and arrayRemove to work with arrays
 1. delete() to delete documents

### Reading data

1. Two methods
    1. 

## Security and Rules

