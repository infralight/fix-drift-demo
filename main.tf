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

 
locals {
  config = yamldecode(file("${path.module}/config.yaml"))
}

module "github_org_management" {
  source = "github.com/terraform-aws-modules/meta//modules/main"

  repositories      = local.config.github_org_management.repositories
  teams             = local.config.github_org_management.teams
  team_memberships  = local.config.github_org_management.team_memberships
  team_repositories = local.config.github_org_management.team_repositories
  branch_protections = local.config.github_org_management.branch_protections
  admins            = local.config.github_org_management.admins
  members           = local.config.github_org_management.members
}