terraform {
  source = "${include.envcommon.locals.base_source_url_github}//app_service?ref=${include.envcommon.locals.app_service_version}"
}

include "root" {
  path   = find_in_parent_folders("root.hcl")
  expose = true
}

include "envcommon" {
  path   = "${dirname(find_in_parent_folders("root.hcl"))}/_envcommon/pdap.hcl"
  expose = true
}

dependency "entra_lookup" {
  config_path = "../entra_lookup"
}

dependency "lookup" {
  config_path = "../../../lookup"
}

dependency "product" {
  config_path = "../product"
}

dependency "solutionsettings" {
  config_path = "../solutionsettings"
}

{{ if not .app_service_plan_name}}
dependency "app_service_plan" {
  config_path = "../app_service_plan"
}
{{end}}

dependencies {
  paths = ["../resource_group"]
}

inputs = {
  # --------------------------------------------------------------------------------------------------------------------
  # Required input variables
  # --------------------------------------------------------------------------------------------------------------------

  # Description: (variable solution_settings did not define a description)
  # Type: any
  solution_settings = dependency.solutionsettings.outputs.settings 

  # Description: (variable tags did not define a description)
  # Type: map
  tags = dependency.solutionsettings.outputs.tags 

  # Description: The runtime you want function to use. One of: 'dotnet', 'java', 'node', 'powershell', 'python', 'php', 'ruby', 'docker'
  # Type: string
  function_worker_runtime = "{{.function_worker_runtime}}"

  # Description: The runtime version you want function to use for function_worker_runtime.
  # Type: string
  runtime_version = "{{.runtime_version}}"

  # Description: Existing storage account name
  # Type: string
  storage_account_name = "${include.root.locals.banner}generalsa${include.root.locals.region}${include.root.locals.environment}"

  # Description: Resource Group Name for the Storage Account
  # Type: string
  storage_account_resource_group = upper("${include.root.locals.banner}-storage-${include.root.locals.region}-${include.root.locals.environment}-rg")

  # Description: Private DNS zone name
  # Type: string
  dns_zone_name = "privatelink.azurewebsites.ne"


  # --------------------------------------------------------------------------------------------------------------------
  # Optional input variables
  # Uncomment the ones you wish to set
  # --------------------------------------------------------------------------------------------------------------------
  # Description: The type of app service you want either AppService or Function, defaults to AppService
  # Type: string
  {{if .app_type}}
  app_type = "{{.app_type}}"
  {{else}}
  # app_type = "LinuxAppService"
  {{end}}

  # Description: Enable .NET Isolated Worker for the function app.
  # Type: bool
  {{if .dotnet_isolated_enabled}}
  dotnet_isolated_enabled = true
  {{else}}
  # dotnet_isolated_enabled = false
  {{end}}

  # Description: The Java server type. Possible values include JAVA, TOMCAT, and JBOSSEAP.
  # Type: string
  {{if .java_server}}
  java_server = "{{.java_server}}"
  {{else}}
  # java_server = "JAVA"
  {{end}}

  # Description: The Java server version.
  # Type: string
  {{if .java_server_version}}
  java_server_version = "{{.java_server_version}}"
  {{else}}
  # java_server_version = "1.17"
  {{end}}

  # Description: The URL of the container registry where the docker_image_name is located. e.g. https://index.docker.io or https://mcr.microsoft.com. This value is required (for docker) with docker_image_name
  # Type: string
  {{if .docker_registry_url}}
  docker_registry_url = "{{.docker_registry_url}}"
  {{else}}
  # docker_registry_url = ""
  {{end}}

  # Description: The docker image, including tag, to be used. e.g. azure-app-service/windows/parkingpage:latest
  # Type: string
  {{if .docker_image_name}}
  docker_image_name = "{{.docker_image_name}}"
  {{else}}
  # docker_image_name = null
  {{end}}

  # Description: Existing service plan name
  # Type: string
  {{if .app_service_plan_name}}
  app_service_plan_name = "{{.app_service_plan_name}}"
  {{else}}
  app_service_plan_name = dependency.app_service_plan.output
  {{end}}

  # Description: Existing service plan resource group
  # Type: string
  {{if .app_service_plan_resource_group}}
  app_service_plan_resource_group = "{{.app_service_plan_resource_group}}"
  {{else}}
  # app_service_plan_resource_group = ""
  {{end}}

  # Description: Existing service plan name
  # Type: string
  {{if .function_version}}
  function_version = "{{.function_version}}"
  {{else}}
  # function_version = "4"
  {{end}}


  # Description: Always On configuration.
  # Type: bool
  {{if .always_on}}
  always_on = true
  {{else}}
  # always_on = false
  {{end}}

  # Description: Optional. Enable HTTP2.
  # Type: bool
  {{if .http2_enabled}}
  # http2_enabled = true
  {{else}}
  http2_enabled = false
  {{end}}

  # Description: The ID of the subnet the app service will be associated to (the subnet must have a service_delegation configured for Microsoft.Web/serverFarms)
  # Type: string
  {{if .integration_subnet_name}}
  integration_subnet_name = "{{.integration_subnet_name}}"
  {{else}}
  # integration_subnet_name = "appsnet-001"
  {{end}}

  # Description: The ID of the subnet the app service will be associated to (the subnet must have a service_delegation configured for Microsoft.Web/serverFarms)
  # Type: string
  {{if .app_service_private_endpoint_subnet_name}}
  app_service_private_endpoint_subnet_name = "{{.app_service_private_endpoint_subnet_name}}"
  {{else}}
  # app_service_private_endpoint_subnet_name = "appsnet-002"
  {{end}}

  # Description: The ID of the subnet the app service will be associated to (the subnet must have a service_delegation configured for Microsoft.Web/serverFarms)
  # Type: string
  {{if .storage_account_private_endpoint_subnet_name}}
  storage_account_private_endpoint_subnet_name ="{{.storage_account_private_endpoint_subnet_name}}"
  {{else}}
  # storage_account_private_endpoint_subnet_name = "sapesnet-001"
  {{end}}

  # Description: Flag to enable application insights. Supported for Function apps only.
  # Type: bool
  {{if .enable_app_insights}}
  enable_app_insights = true
  {{else}}
  # enable_app_insights = false
  {{end}}

  # Description: the id of the log analytics to integrate with, use the log analytics module to get this result.
  # Type: string
  {{if .enable_app_insights}}
  log_analytics_workspace_id = dependency.log_analytics.outputs.log_id
  {{else}}
  # log_analytics_workspace_id = ""
  {{end}}

  # Description: Should connections for Azure Container Registry use Managed Identity.
  # Type: bool
  {{if .container_registry_use_managed_identity}}
  container_registry_use_managed_identity = true
  {{else}}
  # container_registry_use_managed_identity = false
  {{end}}
}