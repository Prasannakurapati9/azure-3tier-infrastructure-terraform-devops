variable "rg_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "web_subnet_id" {
  type        = string
  description = "Web subnet ID"
}

variable "app_subnet_id" {
  type        = string
  description = "App subnet ID"
}

variable "db_subnet_id" {
  type        = string
  description = "Database subnet ID"
}

variable "db_asg_id" {
  type        = string
  description = "Database Application Security Group ID"
}

variable "admin_password" {
  type        = string
  sensitive   = true
  description = "Windows VM administrator password"
}