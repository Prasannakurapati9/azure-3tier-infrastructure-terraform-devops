variable "rg_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "key_vault_name" {
  type        = string
  description = "Globally unique Key Vault name"
}

variable "tenant_id" {
  type        = string
  description = "Microsoft Entra tenant ID"
}