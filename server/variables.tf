variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-08a6efd148b1f7504"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
  type        = string
  default     = "subnet-095804f2ff2be589b"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "production"
}

variable "team" {
  description = "Team responsible for the resource"
  type        = string
  default     = "platform"
}

variable "cost_center" {
  description = "Cost center for billing"
  type        = string
}

variable "server_name" {
  description = "Name for the server"
  type        = string
}
