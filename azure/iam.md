# Identity and Access Management in Azure

## Identity

1. Security principals
    1. Users
    1. Groups
    1. Service principals
    1. Managed Identity
1. Managed identities

## Access management

1. Classic administrators?
1. RBAC (role-based) vs. ABAC (access-based)
1. RBAC
    1. Role assignment = security principal + role definition + scope
    1. Role definition = collection of permissions
    1. Scope = set of resources that access applies to
        1. Can be set at 4 levels:
            1. Management group
            1. Subscription Group
            1. Resource group
            1. Resource
    1. Roles are additive i.e. permissions = sum of all permissions across roles
    1. Deny assignments supported in limited manner
        1. Attaches a set of deny actions to a principal at a particular scope
    1. Deny assignments take precedence over role assignments
    1. Management permissions vs data permissions
    1. Four fundamental roles:
        1. Owner
        1. Contributor
        1. Reader
        1. User-access admin
1. ABAC
    1. Grant a security principal access to a resource based on attributes
    1. More fine-grained than RBAC
    1. Adds role assignment conditions based on attributes in the context of specific actions
    1. Very limited rollout -- currently only for blob storage or queue storage data actions
1. Azure roles vs Azure AD roles
