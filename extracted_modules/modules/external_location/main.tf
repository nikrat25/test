data "databricks_storage_credential" "this" {
    name = var.storage_credential_name
    provider = databricks.analytics
}

resource "databricks_external_location" "some" {
    name            = format("%s_el", var.external_location_name)
    url = format("abfss://%s@%s.dfs.core.windows.net/%s",var.location.container,var.location.storage_account, var.location.path)
    credential_name = var.storage_credential_name
    comment         = "Managed by TF"
    provider = databricks.analytics
}

resource "databricks_grant" "this" {
    for_each = var.assignments

    external_location = databricks_external_location.some.id
    principal  = each.key
    privileges = each.value
    provider = databricks.analytics
}