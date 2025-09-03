output "app_service_id" {
  description = "ID of the App Service"
  value       = azurerm_linux_web_app.app_service.id
}

output "app_service_name" {
  description = "Name of the App Service"
  value       = azurerm_linux_web_app.app_service.name
}

output "app_service_hostname" {
  description = "Default hostname of the App Service"
  value       = azurerm_linux_web_app.app_service.default_hostname
}

output "app_service_url" {
  description = "URL of the App Service"
  value       = "https://${azurerm_linux_web_app.app_service.default_hostname}"
}

output "identity_principal_id" {
  description = "Principal ID of the managed identity"
  value       = azurerm_linux_web_app.app_service.identity[0].principal_id
}