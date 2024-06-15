// outputs.tf

output "resource_group_id" {
  value = azurerm_resource_group.example.id
}

output "resource_group_location" {
  value = azurerm_resource_group.example.location
}
