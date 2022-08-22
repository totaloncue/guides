# Overview of the ELK Stack

## What it is

1. Combination of ElasticSearch + LogStash + Kibana
1. Stack enables log aggregation across systems and apps, log analysis and visualization
1. ElasticSearch = RESTful, distributed search and analytics engine
1. Logstash = data ingestion and enrichment tool (ETL-like)
   1. can be used to query external systems?
1. Kibana = data visualization tool
   1. Visualization and exploration
   1. Management and monitoring
   1. Solutions
1. Beats = lightweight logshipper (like an agent, can be put onto compute instances)

## Setup

```shell
docker network create elastic
docker run --name es01-test -it -d --net elastic -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.13.1
docker run --name kib01-test -it -d --net elastic -p 5601:5601 -e "ELASTICSEARCH_HOSTS=http://es01-test:9200" docker.elastic.co/kibana/kibana:7.13.1
docker run --name es01-test -it -d --net elastic -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" elasticsearch:7.12.1
docker run --name kib01-test -it -d --net elastic -p 5601:5601 -e "ELASTICSEARCH_HOSTS=http://es01-test:9200" kibana:7.12.1
docker stop es01-test
docker stop kib01-test
docker rm es01-test
docker rm kib01-test
docker system prune
```

## Everything

1. Index == store
1. CRUD

   1. Create
      1. POST vs PUT
         1. PUT requires a document ID (=> prevents duplication of same document with multiple unique IDs)
         1. PUT increments document version
      1. Key fields
         1. \_index
         1. \_type
         1. \_id
         1. \_seq_no
         1. \_primary_term
         1. \_version
      1. Each document has a unique ID

1. Index patterns

## Quickstart

1. Start Elasticsearch
   1. Generate kibana token
   ```shell
   usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana
   ```
1. Start Kibana
   1. 

## Configuration

1. Elasticsearch
   1. Set network.host 0.0.0.0
   1. server.publicBaseUrl?
1. Kibana
   1. Set server.host 0.0.0.0
   1. Create an enrolment token on ES server and use that to enroll
   1. Log in
1. Filebeat
   1. Connect to ES
      1. Use the ca_cert created at time of Kibana enrolment
   1. Connect to Kibana
   1. Go to /etc/filebeat/modules.d/elasticsearch.yml and enable as required
