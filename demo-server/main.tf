terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.3.0"
    }
  }
  backend "s3" {
    bucket         = "workflows-pre-ga-test-april-2024"
    key            = "staging-server.tfstate"
    region         = "us-east-1"
  }
}

provider "aws" {
}

module "server" {
  source = "github.com/infralight/fix-drift-demo//server"

  environment = "development"
  cost_center = "cc-1234"
  server_name = "demo-server"
}
