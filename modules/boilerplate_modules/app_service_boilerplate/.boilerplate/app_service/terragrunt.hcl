terraform {
  source = "../../../config/resources/app_service"
}


inputs = {
  # --------------------------------------------------------------------------------------------------------------------
  # Required input variables
  # --------------------------------------------------------------------------------------------------------------------

  # Description: (variable solution_settings did not define a description)
  # Type: any

  # Description: (variable tags did not define a description)
  # Type: map

  # Description: The runtime you want function to use. One of: 'dotnet', 'java', 'node', 'powershell', 'python', 'php', 'ruby', 'docker'
  # Type: string
  function_worker_runtime = "{{.function_worker_runtime}}"

  # Description: The runtime version you want function to use for function_worker_runtime.
  # Type: string
  runtime_version = "{{.runtime_version}}"

  # Description: Existing storage account name
  # Type: string

  # Description: Resource Group Name for the Storage Account
  # Type: string

  # Description: Private DNS zone name
  # Type: string


  # --------------------------------------------------------------------------------------------------------------------
  # Optional input variables
  # Uncomment the ones you wish to set
  # --------------------------------------------------------------------------------------------------------------------
  # Description: The type of app service you want either AppService or Function, defaults to AppService
  # Type: string

  app_type = "{{.app_type}}"


  # Description: Enable .NET Isolated Worker for the function app.
  # Type: bool

  # dotnet_isolated_enabled = false


  # Description: The URL of the container registry where the docker_image_name is located. e.g. https://index.docker.io or https://mcr.microsoft.com. This value is required (for docker) with docker_image_name
  # Type: string

  docker_registry_url = "{{.docker_registry_url}}"


  # Description: The docker image, including tag, to be used. e.g. azure-app-service/windows/parkingpage:latest
  # Type: string

  docker_image_name = "{{.docker_image_name}}"


  # Description: Existing service plan name
  # Type: string

  app_service_plan_name = "{{.app_service_plan_name}}"
  private_endpoint_subnet_id = "sd"


  # Description: Existing service plan resource group
  # Type: string

  app_service_plan_resource_group = "{{.app_service_plan_resource_group}}"


  # Description: Existing service plan name
  # Type: string

  # function_version = "4"



  # Description: Always On configuration.
  # Type: bool

  always_on = "{{.always_on}}"


  # Description: Optional. Enable HTTP2.
  # Type: bool

  http2_enabled = "{{.http2_enabled}}"


  # Description: The ID of the subnet the app service will be associated to (the subnet must have a service_delegation configured for Microsoft.Web/serverFarms)
  # Type: string

  integration_subnet_name = "{{.integration_subnet_name}}"


  # Description: The ID of the subnet the app service will be associated to (the subnet must have a service_delegation configured for Microsoft.Web/serverFarms)
  # Type: string

  app_service_private_endpoint_subnet_name = "{{.app_service_private_endpoint_subnet_name}}"


  # Description: The ID of the subnet the app service will be associated to (the subnet must have a service_delegation configured for Microsoft.Web/serverFarms)
  # Type: string

  storage_account_private_endpoint_subnet_name = "{{.storage_account_private_endpoint_subnet_name}}"


  # Description: Flag to enable application insights. Supported for Function apps only.
  # Type: bool

  enable_app_insights = "{{.enable_app_insights}}"
  # enable_private_endpoint = "{{.enable_private_endpoint}}"

  # Description: the id of the log analytics to integrate with, use the log analytics module to get this result.
  # Type: string

  log_analytics_workspace_id = "test"


  # Description: Should connections for Azure Container Registry use Managed Identity.
  # Type: bool

  container_registry_use_managed_identity = "{{.container_registry_use_managed_identity}}"

  app_service_name = "{{.app_service_name}}"
  location                 = "{{.location}}"
  resource_group_name      = "{{.resource_group_name}}" 
  app_service_plan_id      = "{{.app_service_plan_id}}"

}
