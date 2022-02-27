
locals {
  terraform_version = "Terraform v1.0.1"

  #---------------------------------------------------------------
  # Global
  #---------------------------------------------------------------

  tenant      = "aws001" # AWS account name or unique id for tenant
  environment = "stage"  # Environment area eg., preprod or prod
  zone        = "west1"  # Environment with in one sub_tenant or business unit

  #---------------------------------------------------------------
  # VPC
  #---------------------------------------------------------------

  vpc_name = join("-", [local.tenant, local.environment, local.zone, "vpc"])

  #---------------------------------------------------------------
  # CLUSTER
  #---------------------------------------------------------------

  cluster_name   = join("-", [local.tenant, local.environment, local.zone, "eks"])
  cluster_domain = "<cluster_domain>"

  #---------------------------------------------------------------
  # Rancher
  #---------------------------------------------------------------

  rancher_bootstrap_password = "<rancher_password>"
  lets_encrypt_email         = "<email>"
}
