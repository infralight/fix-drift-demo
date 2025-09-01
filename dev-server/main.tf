terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.3.0"
    }
  }
  backend "s3" {
    bucket         = "workflows-pre-ga-test-april-2024"
    key            = "dev-server.tfstate"
    region         = "us-east-1"
    dynamodb_table = "firefly-runners"
    encrypt        = "true"
  }
}

provider "aws" {
}

module "production-server" {
  source = "github.com/infralight/fix-drift-demo//production-server"

  ami_id      = "ami-08a6efd148b1f7504"
  subnet_id   = "subnet-095804f2ff2be589b"
  cost_center = "blah"
  server_name = "dev-server"
}
