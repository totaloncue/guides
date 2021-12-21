# Elasticsearch Overview

## What it is

1. Distributed search and analytics engine
1. Near real-time search and analytics for all types of data
   1. Structured and unstructured text
   1. Numerical data
   1. Geospatial data

## Use Cases

1. Add search functionality to app/website
1. Store and analyze logs, metrics and security event data
1. Use machine learning to automatically model behaviour of data in real time

## Concepts

1. Document
   1. Collection of fields
   1. Each field has a data type
1. Data streams
1. Distributed document store
   1. Stores complex data structures serialized as JSON documents
   1. In an Elasticsearch cluster with multiple nodes, documents distributed across nodes
      1. Documents can be accessed by any node in the cluster
   1. When storing a document, it is indexed and fully searchable within 1 second
   1. Uses an inverted index as it supports very fast full-text search
      1. Lists every word that appears in the document AND identifies all of the documents each word occurs in
      1. Index = optimized collection of documents
      1. Document = collection of fields (i.e. key-value pairs)
      1. Elasticsearch indexes all data in every field
   1. Elasticsearch can be schema-less, with dynamic mapping
      1. Automatically detects and adds new fields to the index
      1. However, pre-defined mappings are better
      1. The same field can be indexed in different/multiple ways for different purposes
         1. e.g. use more than one language analyzer to process contents of a string field
         1. Analysis chain used to process a full-text field during indexing is also used at search time
1. Search and analysis
   1. REST API to manage cluster and to index+search data
      1. Supports structured queries (similar to SQL), full text queries and complex combinations
      1. Aggregations can provide summations and summaries of data
1. Mapping (during ETL)
   1. Process of defining how a document is stored and indexed
   1. Mapping definiton = list of fields pertinent to document + metadata fields + data types of fields
   1. Two methods of mapping that can be combined: dynamic vs explicit
   1. Dynamic mapping
      1. Useful for early stages of data exploration
      1. Dynamic templates can be used to define custom mappings
   1. Explicit mapping
      1. Use this to precisely choose the mapping definition
      1. Runtime fields can be used to change the schema without having to re-index
   1. Fields can be stored but NOT indexed by setting the 'index' parameter to false
      1. These fields will then be stored but not available for search
   1. Runtime fields
      1. Evaluated at query time
      1. Extremely useful when unsure of the data structure
      1. Can be defined in the index mapping or during the search request
      1. Runtime fields are NOT indexed =>
         1. Index size does not increase
         1. Data ingestion speed increases
         1. Can add fields to an index after ingestion
      1. Downside is that search performance is reduced
      1. Use async search queries to counteract reduction in search speed
   1. Index only fields that are frequently searched, aggregated and filtered on
1. Index templates
1. Data streams
   1. **append-only** time-series data
   1. well-suited for logs, events, metrics etc.
   1. single named resource for search across multiple automatically created backing indices
      1. single stream consists of one or more hidden, auto-generated backing indices
   1. every document indexed to a data stream MUST contain a @timestamp field
   1. requires a matching index template that is used to configure backing indices
1. Ingest pipelines
   1. Permorm transformations on data before indexing
      1. e.g. remove fields, extract values etc.

## Searching Data

1. Request information in indices or data streams
1. Use Query DSL
1. Aggregations
1. Search across multiple indices and data streams
1. Pagination
1. Retrieve select fields only
1. Sort results
1. Async searches
1. Cancellation of search
1.

## Paid Features
