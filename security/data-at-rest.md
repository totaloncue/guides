# Data at rest

## Links

1. [Wikipedia article](https://en.wikipedia.org/wiki/Data_at_rest)
1.

## Concepts

1. Data in computer storage excluding data traversing a network or temporarily residing in computer memory
1. Separation from data-in-use NOT completely clear
   1. Data-in-use often used to refer to "active" data subject to frequent change
   1. Data-at-rest used to refer to "inconstant" data i.e. data subject to infrequent or occasional change
1. Encryption of data at rest
   1. Where are keys stored?

### Storage types and filesystems

1. What is a filesystem?
   1. Method and data structure that OS uses to control how data is stored and retrieved
   1. Structure and logic rules used to manage groups of data and their names
1. What are the most important Linux file systems?
   1. ext4
      1. 4th Extended Filesystem
      1. default/standard on Debian, Ubuntu, openSuse
      1. journaled filesystem => prevents much data loss when system crashes or power lost
   1. BtrFS
      1. b-tree filesystem
      1. has some advanced features like automatic defragmentation and transparent compression
      1. SSD friendly -- automatically disables features useful for mechanical HDDs but that could wear out SSDs
      1. default on Fedora 33 (Desktop/Workstation) and onward
   1. xfs
      1. default on RHEL, Fedora Server, CentOS
      1. excellent performance with parallel reads and writes
      1. journaling support limited => more prone to data loss
      1. shrinking filesystem size is difficult/impossible
   1. squashfs
1. What is a partition?
   1. What is a plain partition?
1. What is a logical volume?

## Terms

1. Encryption
   1. Transform content to make it unreadable without a secret key used to decrypt the information
   1. Block-level encryption
   1. File-level encryption
   1. Directory-level encryption
   1. File-system level encryption
      1. Files and directories are encrypted but NOT the entire disk or partition
      1. Operates on top of the filesystem and is portable across operating systems
   1. Disk-level encryption
      1. Entire disk or block within disk is encrypted using one or more keys
      1. Operates below file-system level
      1. OS-agnostic
      1. Hides directory and file information such as name and size
   1. Key-encrypting key (master key)
1. Tokenization
   1. Process that allows substitution of a token to represent a sensitive piece of information
   1. Tokens must be meaningless on their own
   1. Tokens must NOT be derived from the data they are tokenizing (e.g. cryptographic hash functions)
1. Federation
1. Secure key management
   1. Storage, rotation and access control of keys must be well-defined
   1. Audit the use of encryption keys
1. Access control
   1. Access to data should be tightly controlled + auditable
1. Keep people away from data
1. Transparent data encryption
   1. [Wikipedia reference](https://en.wikipedia.org/wiki/Transparent_data_encryption)
   1. Technology used by Microsoft, IBM and Oracle to encrypt database files
   1. Encryption employed at file level
1. Dm-crypt
   1. Linux kernel-level encryption mechanism that allows users to mount an encrypted file system
   1. Provides transparent encryption of block devices
1. What is cryptsetup?

```shell
# Create a LUKS Format device
# This asks for a passphrase
cryptsetup luksFormat /dev/sdc3
# Open device for use under a given name
cryptsetup luksOpen /dev/sdc3 <name-of-device-when-mapped>
# Create a filesystem on the opened device
mkfs.xfs /dev/mapper/<name-of-device-when-mapped>
# Mount the device
mount /dev/mapper/<name-of-device-when-mapped> /mnt
# Close the device
cryptsetup luksClose <name-of-device-when-mapped>
# Ensure automatically set up on reboot by editing /etc/fstab (not enough)
/dev/mapper/<name-of-device-when-mapped> /<mount-point> <filesystem> defaults 0 0
# Edit /etc/crypttab
<name-of-device-when-mapped> <name-of-partition-used-by-device>
```

1. What is parted?
1. What is lsblk?
1. Logical volumes
1. LUKS (Linux Unified Key Setup)
   1. Disk level encryption mechanism supported across Linux distros
   1. Uses device mapper crypt (dm-crypt) as a kernel module to handle encryption on the block device level
   1. What is luks vs luks1 vs luks2?

## Cloud Provider Overviews

### AWS

1. [AWS Encryption Resources 1](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/resources-9.html)
1. [AWS Encryption Resources 2](https://wa.aws.amazon.com/wat.question.SEC_8.en.html)
1. [How encryption works on AWS](https://www.youtube.com/watch?v=plv7PQZICCM)
1. [Instance store encryption](https://aws.amazon.com/blogs/security/how-to-protect-data-at-rest-with-amazon-ec2-instance-store-encryption/)
1. [EFS documentation on encryption at rest](https://docs.aws.amazon.com/whitepapers/latest/efs-encrypted-file-systems/encryption-of-data-at-rest.html)
1.

### Azure

### GCP

### Aiven

1. Aiven at-rest data encryption covers both active service instances as well as service backups in cloud object storage.
1. Service instances and the underlying VMs use full volume encryption using LUKS with a randomly generated ephemeral key per each instance and each volume.
   1. The key is never re-used and will be trashed at the destruction of the instance, so there’s a natural key rotation with roll-forward upgrades.
   1. We use the LUKS default mode aes-xts-plain64:sha256 with a 512-bit key.
1. Backups are encrypted with a randomly generated key per file.
   1. These keys are in turn encrypted with RSA key-encryption key-pair and stored in the header section of each backup segment.
   1. The file encryption is performed with AES-256 in CTR mode with HMAC-SHA256 for integrity protection.
   1. The RSA key-pair is randomly generated for each service. The key lengths are 256-bit for block encryption, 512-bit for the integrity protection and 3072-bits for the RSA key.
   1. Aiven-encrypted backup files are stored in the object storage in the same region where the service virtual machines are located. For those cloud providers that do not provide object storage services (i.e. DigitalOcean, UpCloud), the nearest region from another cloud provider that provides an object storage is used.
