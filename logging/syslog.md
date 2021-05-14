# Syslog Overview

## What it is

1. Standard for message logging
1. Allows separation of:
   1. Software that generates messages
   1. System that stores messages
   1. Software that analyzes messages
1. Uses a client-server architecture over a network

## Key Components

### Facility

1. Specifies the type of program that is logging the message
1. List of facilities is defined by the standard

### Severity Level

1. Defined by the standard
   1. 0 Emergency - system is unusable
   1. 1 Alert - action must be taken immediately
   1. 2 Critical - critical conditions
   1. 3 Error - error conditions
   1. 4 Warning - warning conditions
   1. 5 Notice - normal but significant conditions
   1. 6 Informational - info messages
   1. 7 Debug - debug messages

### Mnemonic

### Message

1. The actual message to be logged

## Syslog Servers

A number of syslog servers exist:

1. rsyslog
1. syslogd
1. syslog-ng (syslog next generation)

F.A.Q.

1. Where do Linux systems store logs?
   1. Within /var/log/ in text files
1. What utilities does Linux provide to work with logs?
   1. logger - generate syslog messages
   1. logrotate - automatically prune files
1. What is the Elastic stack /ELK stack?
   1. ElasticSearch
      1. Store, analyze and search data
   1. LogStash
      1. Process logstash from applications and send to ElasticSearch
      1. Data processing pipeline
      1. Three-stage process: input, filter, output
   1. Kibana
      1. analytics + visualization
   1. Beats
      1. Data shippers
   1. X-Pack
      1. Additional features to ElasticSearch and Kibana
      1. Adds authentication and authorization to Kibana
      1. Monitoring, alerting and reporting
