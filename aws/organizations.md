# Overview of AWS Organizations

1. Top-level of resource hierarchy in AWS
1. Introduced 2017
1. Consolidates billing across all accounts within the organization

## F.A.Q.

1. What is the management account?
    1. Master account for the organization
1. Can a single email ID be associated with multiple AWS accounts?
    1. No
1. Can an AWS account be part of multiple organizations?
    1. No
1. Can accounts be moved to other Organizations?
    1. Yes, but with some constraints:
        1. Cannot move suspended accounts
        1. Cannot move accounts in root OU
        1. Cannot move accounts that are part of a consolidated billing OU
1. Can I create an account programmatically?
    1. Yes for emails that do not have accounts associated with them as part of an org?
1. What happens to deleted accounts?
    1. They enter SUSPENDED state
1. Can suspended accounts be re-instated?
    1. Only by contacting customer service
