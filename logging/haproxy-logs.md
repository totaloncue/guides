# Overview of Logging in Haproxy

## References

[Introduction](https://cbonte.github.io/haproxy-dconv/2.4/intro.html#3.3.15)

[Configuration](https://cbonte.github.io/haproxy-dconv/2.4/configuration.html#8)

[Management](https://cbonte.github.io/haproxy-dconv/2.4/management.html#8)

## Overview

1. Default log settings for TCP and HTTP are excellent
   1. Both are rich and detailed; little need to alter
   1. The defaults can be extended to include sampled data, variables etc.
1. Log levels can be adjusted per request with standard ACLs
1. Each frontend and backend can use multiple independent log outputs
1. Always relies on a syslog server
1. Does NOT perform any file-system access
1. Standard/preferred use is to send logs over UDP to log server on port 514
   1. Log server can be local or on another machine over the network
   1. Ensure syslog daemon is listening to UDP
1. Also possible to send to stdout/stderr or any file descriptor
1. NOT RECOMMENDED: using UNIX sockets
1. Use the 'halog' utility for in-field troubleshooting

## Log formats

1. Default
   1. Very basic and rarely used
1. TCP
   1. Enabled when "option tcplog" set in frontend
   1. Usually waits for connection to terminate before logging
   1. Detailed format
1. HTTP
   1. Enabled when "option httplog" set in frontend
   1. Usually waits for connection to terminate before logging
   1. Detailed format
1. CLF (Common Log Format) HTTP
   1. Equivalent to HTTP format but fields set in same order as CLF format
1. Custom
   1. Users can create their own formats

## Advanced issues

1. Where relevant, use 'option logasap' to send logs as soon as possible
1. Separate errors using 'log-separate-errors'

## Logging when run within a Docker container

1. Suggested setups:
   1. aws-logs driver in non-blocking mode
      1. Ensure enough memory allocated to buffer to ensure no loss of logs
      1. Disable dual logging cache if reading logs from instance not needed
