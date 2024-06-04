output "mysql_connection_string" {
  value = azurerm_mysql_flexible_server.example.connection_strings[0].value
}


output "app_service_default_hostname" {
  value = azurerm_app_service.example.default_site_hostname
}
