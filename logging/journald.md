# Overview of journald and journalctl

## What it is

1. System service for collecting and storing log data, introduced with systemd
1. Tries to replace plain text logs (as in syslog) with a structured format optimized for log messages
1. However, no mechanism to ship logs to central location
1. use journalctl to access and query entries
   1. filter by date, emitting program, PID, UID, service or other elements
1. Allows for logs with multiple fields and multi-line text
1. Stores messages in a space-efficient manner that requires no log rotation
1. Gives fast access to messages with querying/filtering capabilities, like a database
1. Relies on existing syslog implementations to route messages to the central host

## Configuration

[Guide](https://linuxconfig.org/introduction-to-the-systemd-journal)

1. Configuration file is typically at /etc/systemd/journald.conf
1. Configuration via directory /etc/systemd/journald.conf.d/ is recommended
   1. Files placed in this directory have higher precedence than those in /etc/systemd/journald.conf file
   1. Files are parsed in lexicographic order

## Commands

[DigitalOcean reference](https://www.digitalocean.com/community/tutorials/how-to-use-journalctl-to-view-and-manipulate-systemd-logs)

```shell
# Display logs
journalctl

# Display logs in UTC
journalctl --utc

# Display logs from current boot
journalctl -b

# List previous boots
journalctl --list-boots

# Display logs for a specific boot
journalctl -b -1
journalctl -b <boot_id>

# Show logs between particular times
journalctl --since "2015-01-10 17:15:00"
journalctl --since "YYYY-MM-DD HH:MM:SS" --until "YYYY-MM-DD HH:MM:SS"
journalctl --since yesterday
journalctl --since 09:00 --until "1 hour ago"

# Show logs by unit
journalctl -u nginx.service
journalctl -u nginx.service --since today

# By process, user or Group ID
journalctl _PID=8088
journalctl _UID=1000 --since today
journalctl -F _GID

# Logs by executable path
journalctl /usr/bin/bash

# Kernel messages
journalctl -k
journalctl --dmesg

# By priority level
journalctl -p err -b

# Truncate output
journalctl --no-full

# Output to stdout
journalctl --no-pager

# Output json format
journalctl -b -o json
journalctl -b -o json-pretty

# display recent logs
journalctl -n 20

# Tail/follow logs
journalctl -f

# Find current disk usage
journalctl --disk-usage

# Shrink journal to specified size
sudo journalctl --vacuum-size=1G

# Shrink journal to specific time
sudo journalctl --vacuum-time=1years

# Show available fields for filtering
man systemd.journal-fields

```

## Centralizing logs

1.
