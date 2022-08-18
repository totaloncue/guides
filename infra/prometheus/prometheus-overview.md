# Prometheus Overview

## What it is

1. Open-source systems monitoring and alerting toolkit

## Components

1. Prometheus server
1. Client libraries for application code
1. Push gateway
1. Exporters for services like HAProxy etc.
   1. Node_exporter
   1. Blackbox_exporter
1. Alertmanager

## Key Features

1. Multi-dimensional data model with time series data identified by metric name and key/value pairs
1. Single-server nodes are autonomous
1. PromQL
1. Time series collection via a pull model over HTTP
1. Pushing time series supported with intermediary gateway
1. Targets can be discovered via service discovery or static configuration

## Installation

1. Via pre-compiled binaries
1. Via Docker

```shell
docker run -it -d \
  -p 9090:9090 \
  -v /path/to/config:/etc/prometheus \
  prom/prometheus
```

## Configuration

1. command-line flags
   1. immutable system parameters (e.g. storage locations)
1. configuration file
   1. parameters related to scraping jobs and their instances
   1. rule files to load
   1. can be reloaded at runtime with a SIGHUP to the Prometheus process

## Service discovery


## Node Exporter Overview

1. Designed to monitor the host system
1. NOT recommended to run as a Docker container as it requires access to the host
   1. Instead, install and run it as a systemd service?

## Terms

1. Blackbox probing vs. whitebox monitoring

## Gotchas

1. Not good for 100% accuracy (e.g. for per-second billing)
1. 
