resource "azurerm_resource_group" "example" {
  name     = "my_resource_group"  # Replace with your resource group name
  location = "East US"  # Replace with your desired location
}

resource "azurerm_mysql_flexible_server" "example" {
  name                = "my_mysql_server"  # Replace with your MySQL server name
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  administrator_login = "admin_user"  # Replace with your desired admin username
  administrator_password = "P@ssw0rd123!"  # Replace with your desired admin password

  sku_name   = "Standard_D2s_v3"  # Replace with a valid SKU name for MySQL Flexible Server
  version    = "5.7"
  tags = {
    environment = "development"
  }
}

resource "azurerm_mysql_flexible_database" "example" {
  name                = "my_database"  # Replace with your database name
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_mysql_flexible_server.example.name
  collation           = "utf8mb4_general_ci"
  charset             = "utf8mb4"
}

resource "azurerm_service_plan" "example" {
  name                = "my_app_service_plan"  # Replace with your app service plan name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku_name            = "B1"  # Example, replace with the appropriate SKU name
  kind                = "Linux"  # Example, replace with the appropriate OS type
}

resource "azurerm_app_service" "example" {
  name                = "my_app_service"  # Replace with your app service name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_service_plan.example.id

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }

  site_config {
    always_on = true
  }

  lifecycle {
    ignore_changes = [
      app_settings["WEBSITE_RUN_FROM_PACKAGE"]
    ]
  }
}

resource "azurerm_static_web_app" "example" {
  name                = "my_static_web_app"  # Replace with your static web app name
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
}
