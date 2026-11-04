variable "region" {
  description = "AWS region"
  type = string 
}

variable "cluster_name" {
  description = "EKS cluster name"
  type = string 
}

variable "cluster_version" {
  description = "Kubernetes version"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "desired_size" {
  type = number
}

variable "min_size" {
  type = number
}

variable "max_size" {
  type = number
}
