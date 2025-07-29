terraform {
  source = "${include.envcommon.locals.base_source_url_github}//resource_group?ref=${include.envcommon.locals.resource_group_version}"
}


inputs = {
  # --------------------------------------------------------------------------------------------------------------------
  # Required input variables
  # --------------------------------------------------------------------------------------------------------------------
  contributor_role = "{{.contributor_role}}"

  # --------------------------------------------------------------------------------------------------------------------
  # Optional input variables
  # Uncomment the ones you wish to set
  # --------------------------------------------------------------------------------------------------------------------

}
