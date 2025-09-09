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

  validation {
    condition     = contains(["t3.micro", "t3.nano", "t3.small"], var.instance_type)
    error_message = "Instance type must be one of: t3.micro, t3.nano, t3.small"
  }
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
  validation {
    condition     = contains(["production", "staging", "development"], var.environment)
    error_message = "Environment must be one of: production, staging, development"
  }
}

variable "team" {
  description = "Team responsible for the resource"
  type        = string
  default     = "platform"
}

variable "cost_center" {
  description = "Cost center for billing"
  type        = string
  validation {
    condition     = contains(["cc-1234", "cc-5678", "cc-9101"], var.cost_center)
    error_message = "Cost center must be one of: cc-1234, cc-5678, cc-9101"
  }
}

variable "server_name" {
  description = "Name for the server"
  type        = string
}
