output "id" {
  description = "ID for the VPC."
  value       = module.eks_cluster.eks_cluster_id
}
