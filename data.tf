data "aws_region" "current" {}

data "aws_eks_cluster" "cluster" {
  name = module.eks_cluster.id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks_cluster.id
}