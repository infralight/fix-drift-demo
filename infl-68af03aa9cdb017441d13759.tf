module "terraform-azurerm-avm-auto-test2" {
  source = "github.com/azure/terraform-azurerm-avm-auto-test2"

  location            = "test"
  name                = "test"
  resource_group_name = "test"
}
