# Azure Identity Entra Terraform Template

This Terraform project allows you to quickly set up an Azure Active Directory application, user, and app role using Terraform. It simplifies the process of creating identity and access management components in your Azure environment.

## Getting Started

Follow these steps to use the Terraform template:

### Prerequisites

1. Ensure you have Terraform installed. You can download it from [Terraform Downloads](https://www.terraform.io/downloads.html).

### Installation

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/Abhimanyu9988/azure-identity-entra.git
   cd azure-identity-entra

#### Edit the variables.tf file to customize the display name, mail nickname, and password for the Azure AD user.

### Deployment

Run the installation script to create Azure resources:
 ```bash
 chmod +x install.sh
./install.sh
```


### Outputs
Upon successful deployment, you will receive the following outputs:


client_id: Azure Active Directory Application Client ID.
tenant_id: Azure Active Directory Tenant ID.
client_secret: Azure Active Directory Application Client Secret (sensitive value).
user_principal_name: User Principal Name of the Azure AD user.


### Customization
You can customize the Terraform configuration by modifying the relevant variables in variables.tf and other configuration files.