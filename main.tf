provider "azurerm" {
  features {}
}

# Define variables
variable "resource_group_name" {
  default = "myResourceGroup"
}

variable "location" {
  default = "East US" # Change this to your desired location
}

variable "app_service_plan_name" {
  default = "myAppServicePlan"
}

variable "web_app_name" {
  default = "myWebApp"
}

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Create an App Service plan
resource "azurerm_app_service_plan" "asp" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }
}

# Create a Web App
resource "azurerm_web_app" "wa" {
  name                = var.web_app_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  server_farm_id      = azurerm_app_service_plan.asp.id

  site_config {
    linux_fx_version = "DOCKER|nginx"
  }
}
