variable "solution_settings" {
    description = "Solution settings"
    type = any
}

variable "schema_name" {
    description = "Name of the schema to be created."
    type = string
    nullable = false
}

variable "catalog_name" {
    description = "Name of the Unity Catalog that has already been created and connected to the workspace."
    type = string
}

variable "storage_root" {
    description = "Storage root credential to be used"
    type= object({
        container = string
        storage_account = string
        path = string
    })
    nullable = true
    default = null
}

# TODO: implement group as schema owner
variable "owner" {
    description = "Schema Owner Principal ID/Group name."
    type= string
    nullable = true
    default = null
}

variable "assignments" {
    description = "Grants to be assigned to groups/principles on the catalog."
    type = map(list(string))
    nullable = true
    default = {}
}