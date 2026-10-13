
variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "ai-bankapp-dev"
}

variable "kubernetes_version" {
  description = "Kubernetes version for EKS"
  type        = string
  default     = "1.35"
}

variable "vpc_id" {
  description = "VPC ID for the EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs used by EKS"
  type        = list(string)
}

variable "instance_types" {
  description = "EC2 instance types for worker nodes"
  type        = list(string)
  default     = ["t3.large"]
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}
