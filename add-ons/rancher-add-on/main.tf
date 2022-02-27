module "helm_addon" {
  source            = "github.com/aws-samples/aws-eks-accelerator-for-terraform//modules/kubernetes-addons/helm-addon"
  manage_via_gitops = var.manage_via_gitops
  set_values        = []
  helm_config       = local.helm_config
  irsa_config       = local.irsa_config
}
