terraform {
  source = "../../../config/resources/resource_group"
}

inputs = {
  # --------------------------------------------------------------------------------------------------------------------
  # Required input variables
  # --------------------------------------------------------------------------------------------------------------------

 


  location = "{{.location}}"

  # Description: 
  # Type: Map of required aad ad groups and role
  #aad_group = {
  #  upper("DNA-${include.root.locals.banner}-${include.root.locals.product}-${include.root.locals.region}-${include.root.locals.environment}-WRITER") : "Contributor",
  # upper("DNA-${include.root.locals.banner}-${include.root.locals.product}-${include.root.locals.region}-${include.root.locals.environment}-READER") : "Reader"
  #}

  # --------------------------------------------------------------------------------------------------------------------
  # Optional input variables
  # Uncomment the ones you wish to set
  # --------------------------------------------------------------------------------------------------------------------

}
