variable "rg_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "log_analytics_name" {
  type        = string
  description = "Log Analytics workspace name"
}

variable "monitor_workspace_name" {
  type        = string
  description = "Azure Monitor workspace name"
}