
output "cluster_name" {
  description = "EKS cluster name"
  value       = module.bankapp_eks.cluster_name
}

output "cluster_endpoint" {
  description = "EKS API endpoint"
  value       = module.bankapp_eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "EKS cluster security group ID"
  value       = module.bankapp_eks.cluster_security_group_id
}

output "node_group_names" {
  description = "Managed node group names"
  value       = module.bankapp_eks.eks_managed_node_groups
}
