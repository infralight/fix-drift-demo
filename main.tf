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
  size              = 11

  tags = {
    Name = "infra-storage"
  }
}
