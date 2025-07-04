data "databricks_catalog" "this" {
    name = var.catalog_name
    provider = databricks.analytics
}

# principles need USE_{RESOURCE} on parent resources before grants work for child resources
# A > B, where A is a parent resource of B
# and Catalog > Schema > Securable Object (Function/Table/Materialized View/Volume)
# docs: https://learn.microsoft.com/en-us/azure/databricks/data-governance/unity-catalog/manage-privileges/privileges

# needs to be just a grant (not grants), otherwise other grants on the catalog will be removed:
# "databricks_grants: Authoritative. Sets the grants of a securable and replaces any existing grants defined inside or outside of Terraform."
# per docs: https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/grants
# Removing all other grants would also remove the SPs grant on the catalog,
# which would cause the pipeline to fail.
resource "databricks_grant" "grant_on_catalog" {
    for_each = var.assignments
    catalog = data.databricks_catalog.this.name
    principal = each.key
    privileges = ["USE_CATALOG"]
    provider = databricks.analytics
}

resource "databricks_schema" "this" {
    name = var.schema_name
    catalog_name = data.databricks_catalog.this.name
    storage_root = format("abfss://%s@%s.dfs.core.windows.net/%s",var.storage_root.container,var.storage_root.storage_account, var.storage_root.path)
    
    properties = var.solution_settings.tags
    provider = databricks.analytics
}

resource "databricks_grant" "grants_on_schema" {
    for_each = var.assignments

    schema = databricks_schema.this.id
    principal  = each.key
    privileges = each.value
    provider = databricks.analytics
}
