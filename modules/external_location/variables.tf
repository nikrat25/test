variable "assignments" {
    description = "Grants to be assigned to groups/principles on the external location."
    type = map(list(string))
    nullable = true
    default = {}
}

variable "storage_credential_name" {
    description = "Name of the existing storage credential."
    nullable = false
}


variable "location" {
    description = "Storage root credential to be used"
    type= object({
        container = string
        storage_account = string
        path = string
    })
    nullable = false
}

variable "external_location_name" {
    type = string
}