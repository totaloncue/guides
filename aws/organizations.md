# Overview of AWS Organizations

1. Top-level of resource hierarchy in AWS
1. Introduced 2017
1. Consolidates billing across all accounts within the organization

## F.A.Q.

1. Can a single email ID be associated with multiple AWS accounts?
1. Can an email alias be associated with a different AWS account than the primary?
1. Can an AWS account be part of multiple organizations?
1. How do I manage OUs?
1. How do invitiations work?
1. Can accounts be moved to other Organizations?
    1. Yes, but with some constraints:
        1. Cannot move suspended accounts
        1. Cannot move accounts in root OU
        1. Cannot move accounts that are part of a consolidated billing OU
1. Can I create an account programmatically?
1. Can I move an entire OU with all its accounts to another organization?

