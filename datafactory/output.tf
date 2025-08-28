# outputs.tf - Simple Azure Data Factory for Demo

output "id" {
  description = "Data Factory ID"
  value       = azurerm_data_factory.main.id
}

output "name" {
  description = "Data Factory name"
  value       = azurerm_data_factory.main.name
}

output "location" {
  description = "Data Factory location"
  value       = azurerm_data_factory.main.location
}

output "principal_id" {
  description = "Data Factory managed identity principal ID"
  value       = azurerm_data_factory.main.identity[0].principal_id
}

output "studio_url" {
  description = "Data Factory Studio URL"
  value       = "https://adf.azure.com/en/authoring/externalintegration?factory=/subscriptions/${split("/", azurerm_data_factory.main.id)[2]}/resourceGroups/${azurerm_data_factory.main.resource_group_name}/providers/Microsoft.DataFactory/factories/${azurerm_data_factory.main.name}"
}
