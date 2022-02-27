#---------------------------------------------------------------
# EKS Cluster
#---------------------------------------------------------------

module "eks_cluster" {
  source = "github.com/aws-samples/aws-eks-accelerator-for-terraform?ref=5cbbe7ee4be3c6a945c72d128ded92e5f97885e5"

  #---------------------------------------------------------------
  # Environment
  #---------------------------------------------------------------

  tenant      = var.tenant
  environment = var.environment
  zone        = var.zone

  #---------------------------------------------------------------
  # Network
  #---------------------------------------------------------------

  vpc_id             = var.vpc_id
  private_subnet_ids = var.private_subnets

  #---------------------------------------------------------------
  # EKS CLUSTER
  #---------------------------------------------------------------

  create_eks          = true
  kubernetes_version  = var.kubernetes_version
  managed_node_groups = local.managed_node_groups
}

module "eks_addons" {
  source = "github.com/aws-samples/aws-eks-accelerator-for-terraform//modules/kubernetes-addons?ref=5cbbe7ee4be3c6a945c72d128ded92e5f97885e5"

  #---------------------------------------------------------------
  # Globals
  #---------------------------------------------------------------

  eks_cluster_id = module.eks_cluster.eks_cluster_id

  #---------------------------------------------------------------
  # EKS MANAGED ADD-ONS
  #---------------------------------------------------------------

  enable_amazon_eks_vpc_cni            = true
  enable_amazon_eks_coredns            = true
  enable_amazon_eks_kube_proxy         = true
  enable_amazon_eks_aws_ebs_csi_driver = true
}
