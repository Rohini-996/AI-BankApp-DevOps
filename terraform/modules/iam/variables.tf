
variable "role_name" {
  description = "Name of the IAM role"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}
