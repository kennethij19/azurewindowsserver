output "resource_group_name" {
  description = "Resource group name."
  value       = azurerm_resource_group.main.name
}

output "public_ip_address" {
  description = "Public IP of the Windows VM."
  value       = azurerm_public_ip.main.ip_address
}

output "vm_admin_username" {
  description = "Admin username for the Windows VM."
  value       = azurerm_windows_virtual_machine.main.admin_username
}

output "vm_admin_password" {
  description = "Generated admin password for the Windows VM. Keep it secure."
  value       = random_password.admin.result
  sensitive   = true
}
