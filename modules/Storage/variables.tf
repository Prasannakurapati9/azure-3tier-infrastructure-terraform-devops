

variable "rg_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}
variable "stg_name" {
  type = string
  description = "name of stg account"
}

variable "private_endpoint_subnet_id" {
  type        = string
  description = "Subnet ID for the storage private endpoint"
}
