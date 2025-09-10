terraform {
  source = "../../../../config/resources/app_service"
}

# terraform {
#  source = "git@github.com:nikrat25/test.git//resources/app_service?ref=main"
  
#  extra_arguments "init_args" {
#    commands = ["init"]
#    arguments = [
#      "-upgrade"
#    ]
#  }
# }

# Configure a shorter download directory
# download_dir = "C:/tf-cache/${path_relative_to_include()}"


inputs = {
  # --------------------------------------------------------------------------------------------------------------------
  # Required input variables
  # --------------------------------------------------------------------------------------------------------------------

  type = "{{.type}}"

  app_service_name = "{{.app_service_name}}"

  location = "{{.location}}"

  resource_group_name = "{{.resource_group_name}}"

  app_service_plan_id = "{{.app_service_plan_id}}"

  cors = "{{.cors}}"

  runtime_version = "{{.runtime_version}}"

  app_type = "{{.app_type}}"

  os_type = "{{.os_type}}"

  docker_registry_url = "{{.docker_registry_url}}"

  docker_image_name = "{{.docker_image_name}}"

  app_service_plan_name = "{{.app_service_plan_name}}"

  app_service_plan_resource_group = "{{.app_service_plan_resource_group}}"

  website_pull_image_over_vnet ="{{.website_pull_image_over_vnet}}"

  WEBSITE_PULL_IMAGE_OVER_VNET = "{{.WEBSITE_PULL_IMAGE_OVER_VNET}}"

  key_vault_name = "{{.key_vault_name}}"

  asp_net_core_environment = "{{.asp_net_core_environment}}"

  acr_use_manage_identity_credential = "{{.acr_use_manage_identity_credential}}"

  server_name = "{{.server_name}}"

  always_on = "{{.always_on}}"

  http2_enabled = "{{.http2_enabled}}"

  integration_subnet_name = "{{.integration_subnet_name}}"

  app_service_private_endpoint_subnet_name = "{{.app_service_private_endpoint_subnet_name}}"

  storage_account_private_endpoint_subnet_name = "{{.storage_account_private_endpoint_subnet_name}}"

  enable_app_insights = "{{.enable_app_insights}}"

  function_worker_runtime = "{{.function_worker_runtime}}"

  tenant_id = "{{.tenant_id}}"

  client_id = "{{.client_id}}"

  client_secret = "{{.client_secret}}"

  subscription_id = "{{.subscription_id}}"

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




