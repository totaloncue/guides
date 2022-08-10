# Filesystems Overview

## References

1. [Wiki on comparision of filesytems](https://en.wikipedia.org/wiki/Comparison_of_file_systems)

## FAT32 (File Allocation Table 32)
    1. Commonly found in USB drives, flash drives etc. because of wide compatibility across operating systems

## squashfs
    1. compressed, read-only filesystem for Linux
    1. intended for general read-only filesystem use

## glusterFS (from GNU Cluster)
    1. Founded in India and acquired by Red Hat in 2011 (!)
    1. Aggregates compute, storage and I/O to a global namespace
    1. scale-out network-attached filesystem

## exFAT (extended FAT)
    1. primarily used in Windows

## ext4 (fourth extended filesystem)
    1. default for Debian and Ubuntu
    1. 

## btrfs
    1. default on fedora and suse

## ntfs (New Technology Filesytem)
    1. preferred filesystem on Windows
    1. supports access control lists, filesystem encryption, transparent compression, sparse files and system journaling

## hfs+ (Hierarchical File System Plus / macOS extended)
    1. journaling filesystem
    1. 

## apfs
    1. optimized for solid state storage
    1. supports encryption, snapshots, and increased data integrity
    1. uses GPT (GUID Partition Table) scheme
    1. within GPT scheme, multiple apfs containers
    1. within each container, one or more apfs volumes which share the space of the container
        1. volumes may have apfs volume roles
    1. support for apfs volume groups 
    1. Slow performance on hard drives

## xfs
    1. default on RHEL
    1. excels for parallel input/output operations
    1. cannot be shrunk in place
    1. 

## zfs (zettabyte filesystem)
    1. combines filesystem with a volume manager

## Terms
    1. journaling filesystem
        1. keeps track of changes not yet committed to the main part of the filesystem by recording goal of such changes in a 'journal' (ususally a circular log)
    1. copy-on-write
    1. B-Tree
    1. volume groups
    1. volumes
