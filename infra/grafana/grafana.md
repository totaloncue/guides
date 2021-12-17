# Grafana Overview

1. Query, visualize and alert on metrics, logs and traces

## Hardware Requirements

1. CPU - 1 core
1. RAM - 256 MB

## Key Features

## Installation

## Configuration

1. Two config files: default and custom
1. Default config file location: $WORKING_DIR/conf/defaults.ini
1. Custom config file location: /usr/local/etc/grafana/grafana.ini or /etc/grafana/grafana.ini

## Dashboard and Plugin Library

## Ecosystem

1. Grafana Loki
   1. Horizontally scalable, multi-tenant log aggregation system
1. Prometheus
   1. Monitoring system
1. Grafana Tempo
   1. Distributed tracing system
1. Open Telemetry
   1.

## High Availability

## Scalability

## Security

## Time series databases

1. Optimized for storage of append-only time-series data
1. Examples
   1. Graphite
   1. InfluxDB
   1. Prometheus

## Time series collectors

1. Either push data to a database or allow the database to pull data from it
1. Examples
   1. statsd
   1. collectd
   1. Prometheus exporters
   1. Telegraf

## FAQ

1. Jaeger tracing
   1. Open-source end-to-end distributed tracing
1. How is HA achieved?
   1. Use MySQL or Postgres as backing database
   1. Configure multiple servers to use same database
   1. Use a reverse proxy in front of two Grafana instances
1. What are plugins?
   1. Extend Grafana experience
   1. 3 types: panels, data sources, apps
      1. Panel = new visualizations
      1. Data sources = support for new databases
      1. Apps = Bundle data sources and apps
1. What are most common/essential plugins?
