terraform {
    required_version = ">=1.3.4"
    required_providers {
        databricks = {
        source  = "databricks/databricks"
        version = ">=1.62.0"
        configuration_aliases = [databricks.analytics]
        }
        azurerm = {
        source                = "hashicorp/azurerm"
        version               = ">=3.88.0"
        configuration_aliases = [azurerm.remote]
        }
    }
}
