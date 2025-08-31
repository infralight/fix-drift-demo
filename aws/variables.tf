variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-east-11"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9-]*[a-z0-9]$", var.bucket_name))
    error_message = "Bucket name must be lowercase, start and end with alphanumeric characters, and can contain hyphens."
  }
}

variable "versioning_enabled" {
  description = "Enable versioning for the S3 bucket"
  type        = bool
  default     = true
}

variable "block_public_access" {
  description = "Block all public access to the S3 bucket"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to the S3 bucket"
  type        = map(string)
  default = {
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}