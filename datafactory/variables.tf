# variables.tf - Simple Azure Data Factory for Demo

variable "adf_name" {
  description = "Name of the Data Factory"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default = "East US"
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default = "rg-mars-poc"
}

variable "public_network_enabled" {
  description = "Enable public network access"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}

variable "client_id" {
  description = "Azure Service Principal Client ID"
  type        = string
  sensitive   = true
}

variable "client_secret" {
  description = "Azure Service Principal Client Secret"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}
