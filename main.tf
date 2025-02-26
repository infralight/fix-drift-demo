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

resource "aws_network_interface" "eni-091a987243f791419" {
  attachment {
    instance = "i-01ba64dc8def8db40"
  }
  ipv4_prefix_count = 2
  ipv4_prefixes     = ["10.0.28.128/28", "10.0.29.192/28"]
  private_ip        = "10.0.28.48"
  private_ips       = ["10.0.28.48"]
  security_groups   = ["sg-0002df95adf7e2cbd"]
  subnet_id         = "subnet-0048a951f1a98879c"
  tags = {
    "cluster.k8s.amazonaws.com/name"     = "env2"
    "firefly.ai/cluster"                 = "env2"
    "karpenter.k8s.aws/ec2nodeclass"     = "public-small"
    "karpenter.sh/discovery"             = "env2"
    "karpenter.sh/managed-by"            = "env2"
    "karpenter.sh/nodepool"              = "reserved-public-arm64-dynamic-small-r8g-jobs"
    "kubernetes.io/cluster/env2"         = "owned"
    "node.k8s.amazonaws.com/instance_id" = "i-01ba64dc8def8db40"
  }
}

