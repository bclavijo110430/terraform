resource "azurerm_app_service" "my_app_service_container" {
 name                    = "my_app_service_container"
 location                = "France central"
 resource_group_name     = "MYRG"
 app_service_plan_id     = azurerm_app_service_plan.my_service_plan.id
 https_only              = true
 client_affinity_enabled = true
 site_config {
   scm_type  = "VSTSRM"
   always_on = "true"

   linux_fx_version  = "DOCKER|arc01.azurecr.io/myapp:latest" #define the images to usecfor you application

   health_check_path = "/health" # health check required in order that internal app service plan loadbalancer do not loadbalance on instance down
 }

 identity {
   type         = "SystemAssigned, UserAssigned"
   identity_ids = [data.azurerm_user_assigned_identity.assigned_identity_acr_pull.id]
 }

 app_settings = local.env_variables 
}