variable "instance_type" {
  type        = string
  default     = "t1.micro"
}
variable "member" {
  type = string
  description = "IAM member to add to project"
}

variable "project" {
  type = string
  description = "Project Id"
}

variable "role" {
  type = string
  description = "The role to give to the member"
}
