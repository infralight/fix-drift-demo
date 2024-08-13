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

resource "aws_instance" "ec2_instance" {
  ami = var.ami
  associate_public_ip_address = var.associate_public_ip_address
  availability_zone = var.availability_zone
  cpu_core_count = var.cpu_core_count
  cpu_threads_per_core = var.cpu_threads_per_core
  disable_api_termination = var.disable_api_termination
  ebs_optimized = var.ebs_optimized
  enclave_options {
    enabled = var.enclave_options_enabled
  }
  hibernation = var.hibernation
  iam_instance_profile = var.iam_instance_profile
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  instance_type = var.instance_type
  launch_template {
    id = var.launch_template_id
  }
  metadata_options {
    http_put_response_hop_limit = var.http_put_response_hop_limit
    http_tokens = var.http_tokens
  }
  monitoring = var.monitoring
  private_ip = var.private_ip
  root_block_device {
    delete_on_termination = true
    encrypted = var.root_volume_encrypted
    iops = var.root_volume_iops
    throughput = var.root_volume_throughput
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
    tags = var.root_volume_tags
  }
  secondary_private_ips = var.secondary_private_ips
  subnet_id = var.subnet_id
  tags = var.tags
  tenancy = var.tenancy
  vpc_security_group_ids = var.vpc_security_group_ids
  lifecycle {
    ignore_changes = [timeouts]
  }
}

resource "aws_ebs_volume" "ebs_volume" {
  count = length(var.ebs_volume_size)
  availability_zone = var.ebs_volume_availability_zone
  encrypted = var.ebs_volume_encrypted
  iops = var.ebs_volume_iops[count.index]
  multi_attach_enabled = var.ebs_volume_multi_attach_enabled
  size = var.ebs_volume_size[count.index]
  tags = merge(var.ebs_volume_tags, {
    "ebs.csi.aws.com/cluster" = var.ebs_volume_csi_cluster
  })
  throughput = var.ebs_volume_throughput[count.index]
  type = var.ebs_volume_type[count.index]
}

resource "aws_volume_attachment" "ebs_volume_attachment" {
  count = length(var.ebs_volume_size)
  device_name = var.ebs_volume_device_name[count.index]
  volume_id  = aws_ebs_volume.ebs_volume.*.id[count.index]
  instance_id = aws_instance.ec2_instance.id
}
