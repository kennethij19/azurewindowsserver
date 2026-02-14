# Azure Windows Server Terraform

This Terraform configuration provisions a Windows Server VM in Azure with:

- A new resource group
- Virtual network + subnet
- Public IP address
- Network Security Group allowing RDP (3389)
- Network interface
- Windows Server 2025 VM
- Azure Arc Connected Machine agent installed by default
- Randomly generated local admin password

## Prerequisites

1. Install Terraform (v1.5+ recommended).
2. Install Azure CLI and sign in:

```bash
az login
az account set --subscription "<your-subscription-id>"
```

## Usage

```bash
terraform init
terraform plan -out tfplan
terraform apply tfplan
```

After apply completes, check outputs:

```bash
terraform output public_ip_address
terraform output vm_admin_username
terraform output -raw vm_admin_password
```

## Configuration

Customize values in `terraform.tfvars` (example):

```hcl
location            = "Sweden Central"
resource_group_name = "rg-winserver-prod"
vm_name             = "win-prod-01"
admin_username      = "azureadmin"
vm_size             = "Standard_D2s_v5"
allowed_rdp_cidr    = "203.0.113.10/32"
install_azure_arc_agent = true

tags = {
  environment = "prod"
  managed_by  = "terraform"
  owner       = "platform-team"
}
```

> Security note: lock down `allowed_rdp_cidr` to your trusted public IP/CIDR before deploying.

## Cleanup

```bash
terraform destroy
```
