provider "aws" {
  region = "us-east-1"
  # access_key = var.access_key
  # secret_key = var.secret_key
}

resource "aws_instance" "bar3" {
  ami      = "ami-0341aeea105412b57"
  instance_type = var.instance_type

  ebs_block_device {
    device_name = "/dev/sda1"

    volume_size = 21
  }
}

resource "aws_ebs_volume" "example" {
  availability_zone = "us-west-2a"
  size              = 11

  tags = {
    Name = "HelloWorld"
  }
}
