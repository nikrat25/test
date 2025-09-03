# data "azurerm_resource_group" "existing_rg" {
#   name = "rg-mars-poc"
# }

resource "azurerm_service_plan" "app_service_plan" {
  name                = "asp-test-plan"
  resource_group_name = "rg-mars-poc"
  location            = "centralus"
  os_type             = "Linux"
  sku_name            = "S1"
}

resource "azurerm_linux_web_app" "app_service" {
  name                = var.app_service_name
  location            = "centralus"
  resource_group_name = "rg-mars-poc"
  service_plan_id     = azurerm_service_plan.app_service_plan.id

  site_config {
    always_on = false

    application_stack {
      node_version = "22-lts"
    }

    # dynamic "cors" {
    #   for_each = var.cors_settings != null ? [var.cors_settings] : []
    #   content {
    #     allowed_origins     = cors.value.allowed_origins
    #     support_credentials = cors.value.support_credentials
    #   }
    # }
  }

  identity {
    type = "SystemAssigned"
  }

  # tags = var.tags
}
