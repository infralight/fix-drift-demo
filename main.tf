provider "aws" {
  region = "us-east-1"
  # access_key = var.access_key
  # secret_key = var.secret_key
}



resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1a"
  size              = 13

  tags = {
    Name = "infra-storage"
  }
}
