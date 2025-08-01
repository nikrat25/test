
# This is a Terragrunt module generated by boilerplate.
terraform {
  source = "${include.envcommon.locals.base_source_url_azdo}//pdap/modules/group?ref=${include.envcommon.locals.group_version}"
}

include "root" {
  path   = find_in_parent_folders("root.hcl")
  expose = true
}

include "envcommon" {
  path   = "${dirname(find_in_parent_folders("root.hcl"))}/_envcommon/pdap.hcl"
  expose = true
}

# dependency "ad_group" {
#   config_path = "../ad_group"
# }

dependency "entra_lookup" {
  config_path = "../entra_lookup"
}

inputs = {
  # --------------------------------------------------------------------------------------------------------------------
  # Required input variables
  # --------------------------------------------------------------------------------------------------------------------


  # --------------------------------------------------------------------------------------------------------------------
  # Optional input variables
  # Uncomment the ones you wish to set
  # --------------------------------------------------------------------------------------------------------------------

  # Description: Name of the group to be created.
  # Type: string
  # name = null

  # Description: Object ID of an existing group.
  # Type: string
  id = {{.group_id}}

  # Description: List of object_ids to be set as group owners.
  # Type: list
  # default_owners = null

  # Description: List of object_ids to be set as group members.
  # Type: list
  default_members = dependency.entra_lookup.outputs.groups.object_ids

  # Description: List of access control entries to be set on a folder.
  # Type: list
  aces = [
    {
      path         = "{{.path}}"
      file_system  = "process"
      account_name = "{{.pod}}${include.root.locals.region}${include.root.locals.environment}",
      permissions  = "r-x"
    }
  ]

  # Description: List of roles to be set for the group.
  # Type: list
  # rbacs = []

  # Description: List of kv access definitions.
  # Type: list
  # kv_access = []

  # Description: List of parent group ids.
  # Type: list
  # parent_group_ids = []

  # Description: Description of the group
  # Type: string
  # description = null

}
