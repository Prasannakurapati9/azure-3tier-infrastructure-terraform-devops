variable "rg_name" {
  type = string
  description = "used to name the resource group"
}

variable "location" {
  type = string
  description = "used to name the location"
}

variable "vnet_name" {
  type = string
  description = "used to name the location"
}

variable "web_subnet_id" {
  type = string
  description = "used to name the location"
}

variable "Snet01" {
  type = string
  description = "used to name the Websubnet"
}

variable "Snet02" {
  type = string
  description = "used to name the Appsubnet"
}

variable "Snet03" {
  type = string
  description = "used to name the DBsubnet"
}
variable "Snet04" {
  type = string
  description = "used to name the Bastionsubnet"
}

variable "Snet05" {
  type = string
  description = "used to name the Bastionsubnet"
}
variable "app_subnet_id" {
  type        = string
  description = "Subnet ID for app NIC"
}

variable "db_subnet_id" {
  type        = string
  description = "Subnet ID for database NIC"
}

variable "db_asg_id" {
  type        = string
  description = "Application Security Group ID for database resources"
}

variable "web_asg_id" {
  type        = string
  description = "Application Security Group ID for database resources"
}

variable "app_asg_id" {
  type        = string
  description = "Application Security Group ID for database resources"
}


variable "admin_password" {
  type        = string
  description = "Administrator password for the Windows VM"
  sensitive   = true
}


variable "stg_name" {
  type = string
  description = "stg account name"
}

variable "key_vault_name" {
  type = string
  description = "key vault name"
}

variable "log_analytics_name" {
  type = string
  description = "log analytics name"
}
variable "monitor_workspace_name" {
  type = string
  description = "work space name"
}

