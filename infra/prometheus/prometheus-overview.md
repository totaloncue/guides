# Prometheus Overview

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

## Node Exporter Overview

1. Designed to monitor the host system
1. NOT recommended to run as a Docker container as it requires access to the host
   1. Instead, install and run it as a systemd service?

## Key Components

1. Prometheus
1. AlertManager
1. PushGateway
1. Exporters
   1. Node_exporter
   1. Blackbox_exporter
