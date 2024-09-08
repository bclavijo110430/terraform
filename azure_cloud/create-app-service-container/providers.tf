terraform {
 backend "azurerm" {}
}
provider "azurerm" {
 # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
 version         = "=2.18.0"
 subscription_id = var.acr_subscription_id
 features {}
 skip_provider_registration = "true"

}
provider "azuread" {
 version = "=0.7.0"
}