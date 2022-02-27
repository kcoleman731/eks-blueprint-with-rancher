locals {
  name                 = "rancher"
  namespace            = "cattle-system"
  service_account_name = "${local.name}-sa"

  default_helm_config = {
    name        = local.name
    chart       = local.name
    repository  = "https://releases.rancher.com/server-charts/latest"
    version     = "2.6.3"
    namespace   = local.namespace
    description = "Rancher Helm Chart"
    values      = []
    timeout     = "1200"
  }

  helm_config = merge(
    local.default_helm_config,
    var.helm_config
  )

  irsa_config = {
    kubernetes_namespace              = local.namespace
    kubernetes_service_account        = local.service_account_name
    create_kubernetes_namespace       = true
    create_kubernetes_service_account = true
    iam_role_path                     = "/"
    tags                              = var.tags
    eks_cluster_id                    = var.eks_cluster_id
    irsa_iam_policies                 = []
    irsa_iam_permissions_boundary     = var.irsa_iam_permissions_boundary
  }

  argocd_gitops_config = {
    enable = true
  }
}
