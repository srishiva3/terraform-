output "mysql_connection_string" {
  value = azurerm_mysql_flexible_server.example.fully_qualified_domain_name
}

output "app_service_default_hostname" {
  value = azurerm_app_service.example.default_site_hostname
}
