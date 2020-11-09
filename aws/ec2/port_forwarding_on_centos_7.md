# Simple port forwarding on CentOS 7

[Reference](https://www.linode.com/docs/security/firewalls/introduction-to-firewalld-on-centos/)

1. Install and manage firewalld

   ```shell
   sudo systemctl start firewalld
   sudo systemctl enable firewalld
   sudo systemctl stop firewalld
   sudo systemctl disable firewalld
   sudo firewall-cmd --state
   sudo systemctl status firewalld
   ```

1. Configure firewalld

   1. Add rules to permanent and runtime configuration sets e.g.

   ```shell
   sudo firewall-cmd --zone=public --add-service=http --permanent
   sudo firewall-cmd --zone=public --add-service=http
   ```

1. Port forwarding example - forward all traffic on port 80 to port 3000

   ```shell
   sudo firewall-cmd --zone="public" --add-forward-port=port=80:proto=tcp:toport=3000 --permanent
   sudo firewall-cmd --zone="public" --add-forward-port=port=443:proto=tcp:toport=13000 --permanent
   ```

1. List all current rules

   ```shell
   sudo firewall-cmd --zone=public --list-all
   ```
