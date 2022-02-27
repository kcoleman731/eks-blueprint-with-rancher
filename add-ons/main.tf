#---------------------------------------------------------------
# ADDONS
#---------------------------------------------------------------

module "kubernetes_addons" {
  source = "github.com/aws-samples/aws-eks-accelerator-for-terraform//modules/kubernetes-addons?ref=5cbbe7ee4be3c6a945c72d128ded92e5f97885e5"

  #---------------------------------------------------------------
  # Globals
  #---------------------------------------------------------------

  eks_cluster_id     = var.eks_cluster_id
  eks_cluster_domain = var.eks_cluster_domain

  #---------------------------------------------------------------
  # SELF MANAGED ADD-ONS
  #---------------------------------------------------------------

  enable_external_dns = true
  enable_cert_manager = true
  cert_manager_helm_config = {
    version = "v1.5.1"
  }

  enable_ingress_nginx = true
  ingress_nginx_helm_config = {
    version = "3.12.0"
    values  = [templatefile("${path.module}/values/nginx.yaml", {})]
  }
}

#---------------------------------------------------------------
# Rancher
#---------------------------------------------------------------

module "rancher" {
  source         = "./rancher-add-on"
  eks_cluster_id = var.eks_cluster_id
  helm_config = {
    values = [templatefile("${path.module}/values/rancher.yaml", {
      hostname          = "locals.${var.eks_cluster_domain}"
      email             = var.lets_encrypt_email
      bootstrapPassword = var.rancher_bootstrap_password
    })]
  }

  depends_on = [module.kubernetes_addons]
}
