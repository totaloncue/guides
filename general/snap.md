# Overview of snap package management system

## What it is

1. A snap is a bundle of an app and its dependencies that works without modification across many different Linux distributions
1. Discoverable via an app store like in iOS

## References

1. [Official Snap docs](https://snapcraft.io/docs)
1. [HackerNoon article](https://hackernoon.com/managing-ubuntu-snaps-the-stuff-no-one-tells-you-625dfbe4b26c)

## FAQ

1. snapd daemon manages the snap environment on the local system
1. Channels
   1. Tracks
   1. Risk-levels
   1. Branches
1. Key folders
   1. /snap
   1. /var/snap/
   1. /var/lib/snapd
   1. /home/username/snap
1. Key commands
   1. snap info
   1. snap find
   1. snap install
   1. snap remove
   1. snap refresh
   1. snap enable
   1. snap disable
   1. snap services
   1. snap start
   1. snap stop
1. Where are logs?
   1. Based on app. Check syslog for keepalived
