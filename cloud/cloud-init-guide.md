# Cloud-init Guide

## F.A.Q.

1. Key directories
   1. Configuration files:
      1. /etc/cloud/cloud.cfg
      1. /etc/cloud/cloud.cfg.d/*.cfg
   1. Logs:
      1. /var/log
      1. /run/cloud-init
   1. Data files:
      1. /var/lib/cloud/instance
      1. /var/lib/cloud/data
1. Module frequency options
   1. once, once-per-instance, per-boot
1. Logging support:
   1. Python built-in 
   1. cloud-init event reporting
      1. webhook: POST to a server
      1. log: write to cloud-init log
      1. stdout: print to stdout
   1. cloud-init rsyslog


## Commands

1. Find datasource
```shell
cloud-id
```

1. Debug user-data
```shell
cloud-init schema --system --annotate
```

1. Change module frequency
   1. Change the module from a string to a list
   1. First list item = module name, second = frequency

1. Disable user-data
   1. Set 'allow_userdata: false' in configuration

