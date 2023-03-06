# S3 Access Restriction to Specific User and IAM role

[Guide](https://aws.amazon.com/blogs/security/how-to-restrict-amazon-s3-bucket-access-to-a-specific-iam-role/)
[StackOverflow answer](https://stackoverflow.com/questions/46141593/how-to-write-an-s3-bucket-policy-to-only-allow-specific-iam-role-and-cloudfron)

## Object ownership

1. Determines who can specify access to objects
1. Access Control Lists

## Public access settings

1. By default fully blocked, with four independent settings that block access
granted through:
    1. NEW ACLs
    1. ANY ACLs
    1. NEW public bucket or access point policies
    1. ANY public bucket or access point policies

## Terms

1. Access control Lists
1. Bucket policies
    1. Only a bucket owner can associate a bucket policy with a bucket
1. Access point policies
1. AWS IAM policies
1. Object writer
1. Object owner
1. Bucket owner
1. Bucket versioning
    1. Keep multiple variants of an object
    1. Turned off by default
1. Object lock
    1. Use a write-once-read-many (WORM) model to help prevent objects from being
    overwritten or deleted
    1. Turned off by default
1. Encryption via S3-managed key vs AWS KMS managed key

## F.A.Q.

1. Who owns the bucket?
1. Who created the bucket?
1. Who can modify the bucket?
