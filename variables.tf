variable "instance_type" {
  type        = string
  default     = "t1.micro"
}
variable "ami" {
  type = string
  description = "AMI to use for the EC2 instance"
  required = true
}

variable "associate_public_ip_address" {
  type = bool
  description = "Whether to associate a public IP address with the EC2 instance"
  default = true
}

variable "availability_zone" {
  type = string
  description = "Availability zone for the EC2 instance"
  required = true
}

variable "cpu_core_count" {
  type = number
  description = "Number of CPU cores for the EC2 instance"
  required = true
}

variable "cpu_threads_per_core" {
  type = number
  description = "Number of CPU threads per core for the EC2 instance"
  required = true
}

variable "disable_api_termination" {
  type = bool
  description = "Whether to disable termination of the EC2 instance through the API"
  default = false
}

variable "ebs_optimized" {
  type = bool
  description = "Whether the EC2 instance is optimized for EBS I/O"
  default = false
}

variable "enclave_options_enabled" {
  type = bool
  description = "Whether to enable enclaves"
  default = false
}

variable "hibernation" {
  type = bool
  description = "Whether to enable hibernation for the EC2 instance"
  default = false
}

variable "iam_instance_profile" {
  type = string
  description = "IAM Instance Profile to use for the EC2 instance"
  required = true
}

variable "instance_initiated_shutdown_behavior" {
  type = string
  description = "Shutdown behavior for the EC2 instance when initiated by the instance"
  default = "stop"
}

variable "instance_type" {
  type = string
  description = "Instance type for the EC2 instance"
  required = true
}

variable "launch_template_id" {
  type = string
  description = "Launch template ID to use for the EC2 instance"
  required = true
}

variable "http_put_response_hop_limit" {
  type = number
  description = "The number of hops an instance will allow for HTTP PUT responses."
  default = 2
}

variable "http_tokens" {
  type = string
  description = "Specifies whether the instance uses HTTP Tokens to authenticate with services that require IAM roles for authorization."
  default = "required"
}

variable "monitoring" {
  type = bool
  description = "Whether to enable detailed monitoring for the EC2 instance"
  default = false
}

variable "private_ip" {
  type = string
  description = "Private IP address for the EC2 instance"
  required = true
}

variable "root_volume_encrypted" {
  type = bool
  description = "Whether to encrypt the root volume"
  default = false
}

variable "root_volume_iops" {
  type = number
  description = "IOPS for the root volume"
  default = 3000
}

variable "root_volume_size" {
  type = number
  description = "Size of the root volume in GiB"
  required = true
}

variable "root_volume_tags" {
  type = map(string)
  description = "Tags for the root volume"
  default = {}
}

variable "root_volume_throughput" {
  type = number
  description = "Throughput for the root volume"
  default = 125
}

variable "root_volume_type" {
  type = string
  description = "Type of the root volume"
  default = "gp3"
}

variable "secondary_private_ips" {
  type = list(string)
  description = "List of secondary private IPs for the EC2 instance"
  default = []
}

variable "subnet_id" {
  type = string
  description = "Subnet ID for the EC2 instance"
  required = true
}

variable "tags" {
  type = map(string)
  description = "Tags for the EC2 instance"
  default = {}
}

variable "tenancy" {
  type = string
  description = "Tenancy of the EC2 instance"
  default = "default"
}

variable "vpc_security_group_ids" {
  type = list(string)
  description = "List of VPC security group IDs for the EC2 instance"
  required = true
}

variable "ebs_volume_availability_zone" {
  type = string
  description = "Availability zone for the EBS volumes"
  required = true
}

variable "ebs_volume_csi_cluster" {
  type = string
  description = "CSI cluster for the EBS volumes"
  required = true
}

variable "ebs_volume_encrypted" {
  type = bool
  description = "Whether to encrypt the EBS volumes"
  default = false
}

variable "ebs_volume_device_name" {
  type = list(string)
  description = "Device names for the EBS volumes"
  required = true
}

variable "ebs_volume_iops" {
  type = list(number)
  description = "IOPS for the EBS volumes"
  required = true
}

variable "ebs_volume_multi_attach_enabled" {
  type = bool
  description = "Whether to enable multi-attach for the EBS volumes"
  default = false
}

variable "ebs_volume_size" {
  type = list(number)
  description = "Sizes of the EBS volumes in GiB"
  required = true
}

variable "ebs_volume_tags" {
  type = map(string)
  description = "Tags for the EBS volumes"
  default = {}
}

variable "ebs_volume_throughput" {
  type = list(number)
  description = "Throughputs for the EBS volumes"
  required = true
}

variable "ebs_volume_type" {
  type = list(string)
  description = "Types of the EBS volumes"
  required = true
}
