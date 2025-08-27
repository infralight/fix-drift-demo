module "linux-agents-vnet" {
  source = "github.com/azure/terraform-azurerm-aci-devops-agent//test/fixture/linux-agents-vnet"

  azure_devops_org_name              = "asdf"
  azure_devops_pool_name             = "asdf"
  azure_devops_personal_access_token = "afsd"
  random_suffix                      = 123
}
