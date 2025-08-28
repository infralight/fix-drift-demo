terraform {
  backend "s3" {
    bucket         = "<BUCKET>"
    key            = "<KEY>"
    region         = "<REGION>"
  }

}



module "terraform-azurerm-alz-management" {
  source = "github.com/azure/terraform-azurerm-alz-management"

  location                     = "adsf"
  log_analytics_workspace_name = "afsd"
  automation_account_name      = "tgdsf"
  resource_group_name          = "afsd"
}
