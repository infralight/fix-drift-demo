provider "aws" {
  region = "us-east-1"
  # access_key = var.access_key
  # secret_key = var.secret_key
}

terraform {
  backend "s3" {
    bucket = "infralight-tests"
    key    = "yuval/product-team/terraform.tfstate"
    region = "us-east-2"
  }
}

resource "aws_instance" "bar3" {
  ami      = "ami-048ff3da02834afdc"
  instance_type = var.instance_type

  ebs_block_device {
    device_name = "/dev/sda1"

    volume_size = 21
  }
}

resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1a"
  size              = 13

  tags = {
    Name = "infra-storage"
  }
}

module "linux-agents-vnet" {
  source = "github.com/azure/terraform-azurerm-aci-devops-agent//test/fixture/linux-agents-vnet"

  azure_devops_org_name              = "asdf"
  azure_devops_pool_name             = "asdf"
  azure_devops_personal_access_token = "asdf"
  random_suffix                      = 123
}
