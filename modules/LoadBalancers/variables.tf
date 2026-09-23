
variable "rg_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "web_nic01_id" {
  type        = string
  description = "Web VM 01 NIC ID"
}

variable "web_nic02_id" {
  type        = string
  description = "Web VM 02 NIC ID"
}