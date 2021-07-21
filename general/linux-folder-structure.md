# Overview of Linux Folder Structure (Ubuntu)

The standard Ubuntu directory structure follows the Filesystem Hierarchy Standard

[Filesystem Hierarchy Standard Wiki page](https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard)

## Overview of Important directories

Directory structure is based on scope and categories

1. /bin
   1. Essential command binaries that need to be available in single-user mode e.g. cat, ls, cp
1. /dev
   1. Device files e.g. /dev/null, /dev/disk0 etc
1. /etc
   1. Host-specific system-wide configuration files
   1. Should be restricted to static configuration files
1. /home
   1. users' home directories with saved files, personal settings etc
1. /lib
   1. libraries essential for the binaries in /bin and /sbin
1. /mnt
   1. temporarily mounted filesystems
1. /opt
   1. Optional application software packages
1. /proc
   1. virtual filesystem providing process and kernel information as files
1. /root
   1. home directory for the root user
1. /run
   1. run-time variable data
   1. information about the running system since last boot
1. /sbin
   1. essential system binaries i.e. superuser binaries
1. /tmp
   1. directory for temporary files
1. /usr
   1. secondary hierarchy for read-only user data
   1. contains the majority of multi-user utilities and applications
   1. should be shareable and read-only
   1. /usr/bin
      1. non-essential command binaries for all users
   1. /usr/include
      1. standard include files
   1. /usr/lib
      1. libraries for binaries in /usr/bin and /usr/sbin
   1. /usr/local
      1. tertiary hierarchy for local data specific to host
      1. typically has further directories e.g. bin, lib, share etc.
   1. /usr/sbin
      1. non-essential system binaries e.g. daemons for network services
   1. /usr/share
      1. architecture independent shared data
   1. /usr/src
      1. source code
1. /var
   1. variable files i.e. files whose content is expected to continually change during the normal operation of the system e.g. logs
   1. /var/cache
      1. application cache data
   1. /var/lib
      1. state information
      1. persistent data modified by programs as they run e.g. databases
   1. /var/log
      1. log files
   1. /var/mail
      1. mailbox files
   1. /var/opt
      1. variable data from add-on packages that are stored in /opt
   1. /var/run
      1. run-time variable data
   1. /var/tmp
      1. temporary files to be preserverd between reboots
1. /boot
   1. kernel files
1. /lost+found
   1. damaged files rescued by a recovery tool
1. /proc
   1. currently running processes
   1. have special properties: always appear to be zero-sized, read-only and dated now
