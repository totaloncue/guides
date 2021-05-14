# Logging in Ubuntu

Overview of Logging in Ubuntu

## logrotate

[DigitalOcean Guide](https://www.digitalocean.com/community/tutorials/how-to-manage-logfiles-with-logrotate-on-ubuntu-16-04)

1. logrotate is a system utility that manages automatic rotation and compression of log files
1. Installed by default on Ubuntu and set up to handle log rotation for all installed packages

### Configuration

1. Config files are located at:

   1. /etc/logrotate.conf

      1. default settings + settings for some files not owned by any system packages
      1. pulls in config from any file in the etc/logrotate.d directory
      1. by default, configures weekly rotations with log files owned by root user and syslog group
      1. runs once a day
         1. for different frequency of rotation, set up specialized rotation and use cron to run it

   1. /etc/logrotate.d/
      1. typically where packages that need log rotation install their configs

## Setting up log management for an app

1. Write logs to folder /var/log/<app>/
   1. e.g. /var/log/<app>/error.log and /var/log/<app>/access.log
1. Set up log rotation for logs from app

   1. e.g. create /var/logrotate.d/<app>

   ```shell
   /var/log/<app>/*.log {
    daily
    missingok
    rotate 14
    compress
    notifempty
    create 0640 www-data www-data
    sharedscripts
    postrotate
        systemctl reload example-app
    endscript
   }
   ```

1. Test

```shell
sudo logrotate /etc/logrotate.conf --debug
```

### Independent configuration

```shell
logrotate <path-to-config-file> --state <path-to-state> --verbose
```

Set up above command to run as a cron job
