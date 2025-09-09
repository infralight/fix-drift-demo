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

module "server" {
  source = "github.com/infralight/fix-drift-demo//server"

  server_name = "demo-server-1234"
  environment = "development"
  cost_center = "cc-1234"
}
