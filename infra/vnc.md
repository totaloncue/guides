# Overview of VNC

## References

1. [Fedora Documentation Reference](https://docs.fedoraproject.org/en-US/fedora/latest/system-administrators-guide/infrastructure-services/TigerVNC/#:~:text=TigerVNC%20works%20on%20the%20client,management%20daemon%20for%20its%20configuration.)
1. [DigitalOcean guide for Ubuntu](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-vnc-on-ubuntu-20-04)

## Setup

1. Install a desktop environment on the server (e.g. GNOME)

```shell
dnf group install GNOME
```

1. Install TigerVNC server

```shell
dnf install tigervnc-server
```

1. Configure VNC

```shell
mv ~/.vnc/xstartup ~/.vnc/xstartup.bak


1. Configure VNC service

```shell
cp /lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@.service
```

Edit /etc/systemd/system/vncserver@.service

```config
ExecStart=/sbin/runuser -l USER -c "/usr/bin/vncserver %i -geometry 1280x1024"
PIDFile=/home/USER/.vnc/%H%i.pid
```

Reload daemons

```shell
systemctl daemon-reload
```

Set VNC password for users defined in file

```shell
su - USER
vncpasswd
```

Start, enable, stop etc

```shell
vncserver -localhost
vncserver -kill :display-number
systemctl start vncserver@:display_number.service
systemctl enable vncserver@:display_number.service
systemctl stop vncserver@:display_number.service
systemctl disable vncserver@:display_number.service
```

## Use in Fedora

1. Fedora is well-integrated with TigerVNC
