# Netplan Guide on Ubuntu

## What it is

1. Utility to configure networking on Linux systems

## References

1. [Netplan site](https://netplan.io/)

## Examples

### Add a virtual IP to an EC2 instance and route traffic to instance from within VPC

1. Create an additional configuration file in /etc/netplan (e.g. 99_config.yaml) with fixed addresses

   ```yaml
   addresses:
     - current-address
     - virtual-address
   ```

1. Test configuration using 'sudo netplan generate'

1. Apply configuration using 'sudo netplan apply'

   1. Do we need to bring ip link up as well?

1. Add a route in route table with destination as virtual IP and target as instance

   1. Switch off source/destination checks on instance
