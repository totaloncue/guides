# EBS Overview

## Volumes

Durable block-level storage devices

1. Multiple types of volumes exist:
   1. General purpose SSD
      1. For most live use cases
   1. Provisioned IOPS SSD
      1. High-load database instances
   1. Throughput optimized HDD
      1. Ideal for ETL, data warehouses, log processing
   1. Cold HDD
      1. For workloads that require infrequent access to data
1. Encrypted volumes => data stored at rest, disk I/O and snapshots are all encrypted
1. Dynamic changes possible:
   1. Change size
   1. Change provisioned throughput
   1. Change volume type
1. Volumes persist independent of EC2 instances
1. EBS volumes are automatically replicated within an AZ to prevent data loss due to failure of any single hardware component
1. io1 and io2 volumes can be simultaneously attached to up to 16 Nitro instances
   1. Each instance has full read/write access to the volume
1. Data can be striped across multiple volumes for increased throughput

## Snapshots

1. Point-in-time "snapshots" of EBS volumes
1. Can be copied across AWS regions and used to instantiate new volumes

## Data volumes

## NVME

## Performance Optimization

## Quotas

## Outstanding questions

1. What should i store on my root volume vs other volumes?
1. Why should instance be stopped before taking a snapshot of root volume?
   1. Why is this better for data integrity?
1. What are filesystems and which one should I use? (xfs, ext4)
