# Systemd Overview

## References and Links

[RHEL 8 Documentation](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_basic_system_settings/introduction-to-systemd_configuring-basic-system-settings)

## Useful Commands

1. Inspect unit files

```shell
systemctl cat <service-name.service>
systemctl list-dependencies <service-name.service>
systemctl list-dependencies --all <service-name.service>
systemctl show <service-name.service>
```

## Terms

1. inter-process communication socket
1. listening sockets
1. socket-based activation
1. D-bus
1. bus-based activation
1. clean execution context for each service
1. runlevels/targets/states
