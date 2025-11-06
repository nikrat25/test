terraform {
   source = "."
}

inputs = {
  # --------------------------------------------------------------------------------------------------------------------
  # Required input variables
  # --------------------------------------------------------------------------------------------------------------------

  type = "{{.type}}"
  data_engineer_aad_group_id = "{{.data_engineer_aad_group_id}}"
  datafactory_id = "{{.datafactory_id}}"
}










