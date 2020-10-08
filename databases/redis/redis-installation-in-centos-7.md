# Redis Installation on CentOS 7

1. Redis 5 installation
   1. Try https://ius.io/ sudo yum -y install redis5
   1. Configuration
      1. The TCP backlog setting of 511 cannot be enforced because /proc/sys/net/core/somaxconn is set to the lower value of 128
         1. add net.core.somaxconn=65535 in the /etc/sysctl.conf file and restart
      1. 'vm.overcommit_memory = 1' to /etc/sysctl.conf and then reboot or run the command 'sysctl vm.overcommit_memory=1' for this to take effect
      1. 'echo never > /sys/kernel/mm/transparent_hugepage/enabled' as root
      1. [Linode reference](https://www.linode.com/docs/databases/redis/install-and-configure-redis-on-centos-7/)
   1. Auto-start on reboot
      1. sudo systemctl enable redis
      1. sudo systemctl disable redis (to switch off)
