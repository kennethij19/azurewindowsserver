variable "location" {
  description = "Azure region where resources will be created."
  type        = string
  default     = "Sweden Central"
  default     = "East US"
}

variable "resource_group_name" {
  description = "Name of the resource group to create."
  type        = string
  default     = "rg-winserver-se-demo"
}

variable "install_azure_arc_agent" {
  description = "Install Azure Arc Connected Machine agent on the Windows VM."
  type        = bool
  default     = true
  default     = "rg-winserver-demo"
}

variable "vm_name" {
  description = "Name of the Windows VM."
  type        = string
  default     = "winvm01"
}

variable "admin_username" {
  description = "Local administrator username for the VM."
  type        = string
  default     = "azureadmin"
}

variable "vm_size" {
  description = "Azure VM size."
  type        = string
  default     = "Standard_B2ms"
}

variable "allowed_rdp_cidr" {
  description = "CIDR block allowed to access RDP (3389). Use a trusted IP range."
  type        = string
  default     = "0.0.0.0/0"
}

variable "tags" {
  description = "Tags applied to all resources."
  type        = map(string)
  default = {
    environment = "demo"
    managed_by  = "terraform"
  }
}
