locals {
  terraform_version = "Terraform v1.0.1"

  managed_node_groups = {
    mg_4 = {
      node_group_name = "managed-ondemand"
      instance_types  = ["m4.large"]
      desired_size    = 5
      max_size        = 10
      min_size        = 3
      max_unavailable = 1
      subnet_ids      = var.private_subnets
    }
  }
}
