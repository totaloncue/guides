# Overview of IAM on AWS

1. Workload = collection of resources + code that delivers business value
    1. e.g. applications, opeartional tools and components
1. Principal = human user or workload
    1. person or app that uses root, IAM user or IAM role to sign in and make requests
1. Identities = users, groups, IAM roles
1. Identity-based policies vs. resource-based policies
    1. Identity-based = attached to an IAM Identity
        1. Control what actions the identity can perform, on which resources,
        and under what conditions
    1. Resource-based = attached to resources
        1. Control which identities/princapals can take what actions on the resource under
        what conditions
1. Cross-account access can be facilitated with resource-based policies
    1. Specify an entire account or IAM entities in another account as the principal in an
    resource-based policy
1. Attribute-based access policies (ABAC)
    1. Define permissions based on attributes (tags)
