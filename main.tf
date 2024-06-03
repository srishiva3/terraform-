resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_mysql_flexible_server" "example" {
  name                = var.mysql_server_name
  resource_group_name = azurerm_resource_group.example.name
  location            = var.location
  administrator_login = var.mysql_admin_username
  administrator_password = var.mysql_admin_password

  sku_name   = "B_Gen5_1"  # Replace with a valid SKU name for MySQL Flexible Server
  version    = "5.7"
  tags = {
    environment = "development"
  }
}

resource "azurerm_mysql_flexible_database" "example" {
  name                = var.mysql_database_name
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_mysql_flexible_server.example.name
  collation           = "utf8mb4_general_ci"
  charset             = "utf8mb4"
}

resource "azurerm_service_plan" "example" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "example" {
  name                = var.app_service_name
  location            = var.location
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

resource "azurerm_static_site" "example" {
  name                = var.static_web_app_name
  resource_group_name = azurerm_resource_group.example.name
  location            = var.location

  sku_size = "Standard"  # Replace with the appropriate size
}
