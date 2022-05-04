# Fedora Installation Overview

## Documentation

1. [Official Documentation](https://docs.fedoraproject.org/en-US/fedora/f35/install-guide/install/Installing_Using_Anaconda/)

## Automated installs with Kickstart

1. Kickstart files contain all the steps necessary to fully install Fedora
1. Recommended approach is to use Anaconda on one system and have Anaconda generate anaconda-ks.cfg as part of this process; then use the Kickstart file for all other sytems
1. Verify kickstart file

```shell
dnf install pykickstart
ksvalidator /path/to/kickstart.ks
```

1. pre-install scripts in the %pre section
	1. network available
	1. name services not available
	1. => only IP addresses work, NOT URLs
	1. not run in a chroot environment

1. post-install scripts in the %post section
	1. once install is complete but before system is booted for first time
	1. run in a chroot environment

1. packages section
	1. specify packages by environment, group or package name
	1. @^ = environment (e.g. cloud-server-environment)
	1. @ = group 
	1. Individual packages mentioned one per line
	1. -(leading dash) specifies items to exclude

## Partitioning

1. Linux LVM (Logical Volume Manager) vs BTRFS (better FS/b-tree FS)
	1. Linux LVM 
	1. BTRFS combines a filesystem based on the copy-on-write principle with a logical volume, developed together
		1. Default in Fedora since Fedora 33

### Boot Loader

1. Fedora uses GRUB2 (GRand Unified Bootloader version 2) 
1. Boot loader is the first program that runs when the computer starts
	1. Responsible for loading and transferring control to an operating system
1. GRUB2 can boot any supported OS (including Windows) + use chain loading to transfer control to other boot loaders for unsupported operating systems (like MacOS?)
1. Installation of the new bootloader can be skipped/declined in the Full Disk summary and bootloader > Selected Disks dialog
	1. => system must be booted by using some alternate boot loader (e.g. rEFInd)
## Encryption

1. All partitions **except ones needed for boot** (e.g. /boot) will be encrypted using LUKS

## Terms

1. Standard partition
	1. Most common with widest support (e.g. only version supported by Windows)
	1. /boot and EFI filesystem partition should be standard
