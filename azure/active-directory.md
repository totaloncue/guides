# Overview of Azure AD

1. User directory application

## Concepts

1. Users
    1. User Principal Name
    1. User Types
    1. Identities
1. Groups
    1. Group Types
1. Roles and administrators
    1. Protected actions
1. Enterprise applications
    1. Assigned Users and Groups
    1. Roles and admins
    1. Galleries
    1. Single sign-on
    1. Automated provisioning
    1. Self-service
1. App registrations
1. Devices

## F.A.Q.

1. 

## SSO with AWS IAM Identity Center

1. [Guide on AWS docs](https://docs.aws.amazon.com/singlesignon/latest/userguide/azure-ad-idp.html)
1. [Azure guide](https://learn.microsoft.com/en-us/azure/active-directory/saas-apps/aws-single-sign-on-tutorial)
1. [Automated user provisioning guide](https://learn.microsoft.com/en-us/azure/active-directory/saas-apps/aws-single-sign-on-provisioning-tutorial)
1. [Automated user provisioning overview](https://learn.microsoft.com/en-us/azure/active-directory/app-provisioning/user-provisioning)

### Configure with auto-provisioning

1. Configuration on Azure AD:
    1. Create a new enterprise application
    1. Set up single-sign-on using SAML:
        1. Get the metadata file from AWS IAM Identity Center and upload
            1. Identifier, Reply URL will be auto-filled
    1. Download identity-provider metadata and certificates to be uploaded to AWS
    1. Create a test user in the Azure AD
    1. Add the user to the application
1. Configuration on AWS IAM Identity Center:
    1. Set up the identity source
        1. Use the IdP metadata file from Azure AD Configuration
    1. Create a matching test user in IAM Identity Center
    1. Add the user/group to an AWS account with a relevant permission Set
        1. Ensure the username in AWS matches the email ID of the user on Azure AD
1. Test the sign-on
1. Set up auto-provisioning:
    1. Follow on-screen instructions on AWS
    1. Start provisioning on Azure AD Enterprise Apps
    1. Provisioning groups needs Azure AD Premium subscription
    1. Directory will auto-sync every 40 minutes
    1. [Gotchas with respect to AWS provisioning requirements](https://docs.aws.amazon.com/singlesignon/latest/userguide/troubleshooting.html#issue2)
        1. Make sure username, First Name, Last Name and Display Name are Set
        1. Email is optional but recommended

