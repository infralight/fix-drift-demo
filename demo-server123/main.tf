terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.3.0"
    }
  }
  backend "s3" {
    bucket         = "<BUCKET>"
    key            = "<KEY>"
    region         = "<REGION>"
  }
}

provider "aws" {
}

module "server" {
  source = "github.com/infralight/fix-drift-demo//server"

  environment = "staging"
  cost_center = "cc-1234"
  server_name = "demo-server123"
}
