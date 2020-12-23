# LetsEncrypt SSL Guide

## What it is

[LetsEncrypt FAQ](https://letsencrypt.org/docs/faq/)

1. Certificate authority that provides free SSL certificates
1. Uses the ACME protocol running on web host
1. Certificates are valid for 90 days without exception
   1. Recommended to auto-renew certificates every 60 days
1. Issuance and renewal can be automated
1. Preferred ACME client on most systems is certbot

## Certbot on Ubuntu 20/CentOS7

[Instructions](https://certbot.eff.org/lets-encrypt/ubuntufocal-other)

1. SSH into server
1. Install snapd (most likely pre-installed)

   1. Ubuntu -- should be pre-installed
   1. [CentOS 7](https://snapcraft.io/docs/installing-snap-on-centos)

   ```shell
   sudo yum install epel-release
   sudo yum install snapd
   sudo systemctl enable --now snapd.socket
   sudo ln -s /var/lib/snapd/snap /snap
   ```

1. Update snapd

```shell
sudo snap install core; sudo snap refresh core
```

1. Remove OS-delivered Certbot packages (should not be necessary)

   ```shell
   sudo yum remove certbot
   sudo apt-get remove certbot
   ```

1. Install Certbot

```shell
sudo snap install --classic certbot
```

1. Prepare the Certbot command

```shell
sudo ln -s /snap/bin/certbot /usr/bin/certbot
```

1. Choose how to run Certbot

   1. No other web server running

   ```shell
   sudo certbot certonly --standalone
   ```

   1. Other web server running

   ```shell
   sudo certbot certonly --standalone -d <domain-name> --preferred-challenges http --http-01-port <port opened on haproxy for letsencrypt>
   sudo certbot certonly --standalone -d api.courtupapp.xyz --preferred-challenges http --http-01-port 54321 --dry-run
   ```

1. Install certificate in config file for server

   1. Certificates will be installed in /etc/letsencrypt/live and /etc/letsencrypt/archive
   1. Provide access to current user as necessary

   ```shell
   sudo chown $(whoami):<group_name> /etc/letsencrypt/live/ -R
   sudo chown $(whoami):<group_name> /etc/letsencrypt/archive/ -R
   e.g.
   sudo chown $(whoami):ubuntu /etc/letsencrypt/live/ -R
   sudo chown $(whoami):ubuntu /etc/letsencrypt/archive/ -R
   ```

1. Test auto-renewal

   ```shell
   sudo certbot renew --dry-run
   ```

   1. Add pre and post renewal hook scripts to stop and start any running webservers (e.g. HAProxy)
   1. [With HAProxy](https://www.digitalocean.com/community/tutorials/how-to-secure-haproxy-with-let-s-encrypt-on-ubuntu-14-04)

      1. Create a renewal script and place it somewhere easily accessible (e.g. /usr/local/bin/renew.sh)
         1. Make it accessible (e.g. sudo chmod 745 /usr/local/bin/renew.sh)
      1. Renewal script simply places formatted certificate into correct folder for HAProxy and reloads

      ```shell
      sudo mkdir /etc/haproxy/certs
      sudo chown centos:centos /etc/haproxy/certs -R
      ```

      ```shell
      #!/bin/sh

      SITE=example.com

      # move to the correct let's encrypt directory
      cd /etc/letsencrypt/live/$SITE

      # cat files to make combined .pem for haproxy
      cat fullchain.pem privkey.pem > /etc/haproxy/certs/$SITE.pem

      # reload haproxy
      # does NOT work on CentOS
      service haproxy reload
      # for CentOS
      service haproxy restart
      ```

      1. Update Certbot config to work on a port other than 80/443

         1. config should be in /etc/letsencrypt/renewal/example.com.conf
         1. Add/edit a line

         ```
         http01_port = 54321
         ```

1. Confirm that Certbot worked

## Use with HAProxy

1. Create combined cert file -- example below

   ```shell
   DOMAIN='example.com' sudo -E bash -c 'cat /etc/letsencrypt/live/$DOMAIN/fullchain.pem /etc/letsencrypt/live/$DOMAIN/privkey.pem > /etc/haproxy/certs/$DOMAIN.pem'
   sudo chmod -R 777 /etc/haproxy/certs
   ```
