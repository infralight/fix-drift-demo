module "terraform-azurerm-avm-ptn-aks-economy" {
  source = "github.com/azure/terraform-azurerm-avm-ptn-aks-economy"

  location            = "rttr"
  resource_group_name = "rt"
  name                = "rtrt"
}
