terraform {
  backend "local" {
    path = "local_tf_state/terraform-main.tfstate"
  }
}

#---------------------------------------------------------------
# VPC
#---------------------------------------------------------------

module "vpc" {
  source = "./vpc"

  vpc_name     = local.vpc_name
  cluster_name = local.cluster_name
}

#---------------------------------------------------------------
# EKS Cluster
#---------------------------------------------------------------

module "eks_cluster" {
  source = "./eks-cluster"

  tenant      = local.tenant
  environment = local.environment
  zone        = local.zone

  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets

  cluster_domain = local.cluster_domain
}

#---------------------------------------------------------------
# ADDONS
#---------------------------------------------------------------

module "add_ons" {
  source = "./add-ons"

  eks_cluster_id             = module.eks_cluster.id
  eks_cluster_domain         = local.cluster_domain
  lets_encrypt_email         = local.lets_encrypt_email
  rancher_bootstrap_password = local.rancher_bootstrap_password
}
