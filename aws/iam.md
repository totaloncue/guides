# Overview of IAM on AWS

## Key terms and concepts

1. Workload = collection of resources + code that delivers business value
    1. e.g. applications, opeartional tools and components
1. Principal = human user or workload
    1. person or app that uses root, IAM user or IAM role to sign in and make requests
1. Identities = root user, users, groups, IAM roles
    1. User = name + long-duration credentials
        1. Defined within a single AWS account
1. Policies
    1. Identity-based = attached to an IAM Identity
        1. Control what actions the identity can perform, on which resources,
        and under what conditions
    1. Resource-based = attached to resources
        1. Control which identities/princapals can take what actions on the resource under
        what conditions
    1. Permissions boundaries
        1. Use a managed policy as max permissions boundary for an IAM entity
    1. Organization service control Policies
        1. Max permissions for account members of an organization or unit
1. Cross-account access can be facilitated with resource-based policies
    1. Specify an entire account or IAM entities in another account as the principal in an
    resource-based policy
1. Attribute-based access policies (ABAC)
    1. Define permissions based on attributes (tags)
1. Conditions
    ```javascript
    "Condition": {
        "<condition-operator>": {
            "<condition-key>": "<condition-value>"
        }
    }
    ```
    1. Global and service-specific condition keys are supported
    1. Condition key names are NOT case-sensitive
    1. Condition key values can be case-sensitive depending on the condition operator
    1. Condition elements can contain multiple blocks, with each block containing multiple key-value pairs
        1. Multiple values with one condition key = OR
        1. Multiple condition keys = AND
        1. Multile condition blocks = AND
    1. Condition operator types:
        1. String
        1. Numeric
        1. Date and time
        1. Boolean
        1. Binary
        1. IP address
        1. ARN
        1. IfExists
        1. Null check
1. The request context
1. Policy variables
    1. Supported by string operators + ARN operators in conditions

## Use cases

1. MFA conditions
    1. Restrict access to users who have signed in with MFA:
    ```javascript
    "Condition": { "Bool": { "aws:MultiFactorAuthPresent": "true" } }
    "Condition": { "NumericLessThanEquals": { "aws:MultiFactorAuthAge": 3600 } }
    ```
1. Tag conditions
    1. Only allow actions on resources with a particular tag
    ```javascript
    "Condition": { 
        "StringEquals": { "aws:ResourceTag/<tag-key>": "<tag-value>" }
        "StringEquals": { "aws:ResourceTag/Owner": "${aws:username}" }
    }
    ```
    1. Only allow tagging resources with the environment tag which must have one of two values as shown
    ```javascript
    "Condition": { 
        "StringEquals": { "aws:RequestTag/environment": [
            "development",
            "staging",
            ]
        }
        "ForAllValues:StringEquals": {"aws:TagKeys": "environment"}
    }
    ```
1. Policy variables
