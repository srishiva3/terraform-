variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
}

variable "mysql_server_name" {
  description = "The name of the MySQL Flexible Server"
  type        = string
}

variable "mysql_admin_username" {
  description = "The admin username for the MySQL server"
  type        = string
}

variable "mysql_admin_password" {
  description = "The admin password for the MySQL server"
  type        = string
  sensitive   = true
}

variable "mysql_database_name" {
  description = "The name of the MySQL database"
  type        = string
}

variable "app_service_plan_name" {
  description = "The name of the App Service Plan"
  type        = string
}

variable "app_service_name" {
  description = "The name of the App Service"
  type        = string
}

variable "static_web_app_name" {
  description = "The name of the Static Web App"
  type        = string
}

