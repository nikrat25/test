terraform {
  source = "${include.envcommon.locals.base_source_url_github}//resource_group?ref=${include.envcommon.locals.resource_group_version}"
}

include "root" {
  path   = find_in_parent_folders()
  expose = true
}

include "envcommon" {
  path   = "${dirname(find_in_parent_folders())}/_envcommon/pdap.hcl"
  expose = true
}

dependency "solutionsettings" {
  config_path = "../solutionsettings"
}

dependency "product" {
  config_path = "../product"
}

#TODO: Is this a dependency for rg or not
dependency "entra_lookup" {
  config_path = "../entra_lookup"
}

#TODO: Is this a dependency for rg or not
dependency "lookup" {
  config_path = "../../../lookup"
}

inputs = {
  # --------------------------------------------------------------------------------------------------------------------
  # Required input variables
  # --------------------------------------------------------------------------------------------------------------------

  # Description: (variable solution_settings did not define a description)
  # Type: any
  solution_settings = dependency.solutionsettings.outputs.settings # TODO: fill in value

  # Description: (variable tags did not define a description)
  # Type: map
  tags = dependency.solutionsettings.outputs.tags # TODO: fill in value

  # Description: 
  # Type: Map of required aad ad groups and role
  aad_group = {
    upper("DNA-${include.root.locals.banner}-${include.root.locals.product}-${include.root.locals.region}-${include.root.locals.environment}-WRITER") : "Contributor",
    upper("DNA-${include.root.locals.banner}-${include.root.locals.product}-${include.root.locals.region}-${include.root.locals.environment}-READER") : "Reader"
  }

  # --------------------------------------------------------------------------------------------------------------------
  # Optional input variables
  # Uncomment the ones you wish to set
  # --------------------------------------------------------------------------------------------------------------------

}