provider "aws" {
  region = "us-east-1"
  # access_key = var.access_key
  # secret_key = var.secret_key
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

 
module "firefly_relay_backend" {
  source = "github.com/gofireflyio/firefly-private-connector//terraform"
  aws_region = "us-east-1"
  instance_ami = "ami-0782e0cb3002df46a"
  instance_type = "c7a.xlarge"
  key_pair_name = ""
  security_group_id = "sg-064b7b8e0ef299c6e"
  user = "placeholder_user"
  remote_host = "placeholder_remote_host"
  remote_port = 22
  source_port = 0
  target_host = "placeholder_target_host"
  target_port = 0
  certificate_path = "placeholder_certificate_path"
  certificate_pem = "placeholder_certificate_pem"
  sleep_duration = 5
  app_version = "1.0.0"
  module_version = "0.1.0"
  tags = {
    "firefly.ai/cluster" = "automation"
    "karpenter.k8s.aws/ec2nodeclass" = "public"
    "karpenter.sh/discovery" = "automation"
    "karpenter.sh/managed-by" = "automation"
    "karpenter.sh/nodepool" = "public-dynamic-jobs"
    "kubernetes.io/cluster/automation" = "owned"
  }
}