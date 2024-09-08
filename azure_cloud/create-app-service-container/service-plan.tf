
resource "azurerm_app_service_plan" "my_service_plan" {
 name                = "my_service_plan"
 location            = "France central"
 resource_group_name = "MYRG"
 kind                = "Linux"
 reserved            = true

 sku {
   tier     = "PremiumV2"
   size     = "P2v2"
   capacity = "3"
 }
}