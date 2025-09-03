variable "app_service_name" {
  description = "Name of the App Service"
  type        = string
}

variable "runtime_version" {
  description = "Runtime version (e.g., NODE|18-lts)"
  type        = string
  default     = "22-lts"
}

variable "always_on" {
  description = "Keep app always on"
  type        = bool
  default     = false
}

variable "app_settings" {
  description = "App settings"
  type        = map(string)
  default     = {}
}

variable "cors_settings" {
  description = "CORS configuration"
  type = object({
    allowed_origins     = list(string)
    support_credentials = bool
  })
  default = null
}


variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}

variable "client_id" {
  description = "Azure service principal client ID"
  type        = string
}

variable "client_secret" {
  description = "Azure service principal client secret"
  type        = string
}

variable "tenant_id" {
  description = "Azure tenant ID"
  type        = string
}

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}
