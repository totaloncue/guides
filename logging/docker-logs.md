# Overview of Logging from within Docker containers

1. By default 'docker logs' shows STDOUT and STDERR
1. Logging drivers are mechanisms to get log information from within containers
1. Logging drivers can be set at the container level or at the system level
   1. Container level overrides system level for specified container
1. Two modes of message delivery from container to logging driver
   1. Direct/blocking = default
   1. 'non-blocking' using intermediate per-container ring buffer
      1. prevents apps from blocking due to logging pressure
      1. however, can result in dropped logs if buffer is full
      1. use '--log-opt mode=non-blocking' when starting container
      1. use '--log-opt max-buffer-size=4m' to specify buffer size

## Logging drivers

1. json-file
   1. default
   1. caches container logs as JSON internally
1. none
   1. no logs
1. local
   1. custom format designed for minimal overhead
1. syslog
   1. writes log messages to the syslog facility
   1. syslog daemon must be running on host
1. journald
   1. writes log messages to journald
   1. journald daemon must be running on host
1. gelf (Graylog Extended Log Format)
   1. writes messages to gelf endpoing such as Graylog or Logstash
1. fluentd
   1. writes to fluentd
   1. fluentd daemon must be running on host
1. awslogs
   1. writes logs directly to aws cloudwatch
1. splunk
   1. writes to splunk using the HTTP event collector
1. gcplogs
   1. writes to Google Cloud Platform logging

## Best Practices

[DataDog article](https://www.datadoghq.com/blog/docker-logging/)

[Sematext article](https://sematext.com/guides/docker-logs/)

1. Use cases for 'blocking' mode
   1. Recommended for most use-cases:
      1. json-file 'blocking' mode + agent-based log collector (e.g. DataDog or CloudWatch agent)
      1. can capture ALL logs with little risk of degrading app
      1. can control log rotation at a container level
   1. ONLY use blocking mode if using a logging driver that writes to local file
   1. RAM intensive applications -- as non-blocking requires allocation of memory to a ring buffer
1. Use cases for 'non-blocking' mode
   1. NEVER use the blocking mode when working with a logging driver that communicates with a remote server
   1. Ensure enough RAM provisioned for ring buffer
