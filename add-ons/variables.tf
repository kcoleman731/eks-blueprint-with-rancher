
variable "eks_cluster_id" {
  type        = string
  description = "EKS cluster id."
  default     = ""
}

variable "eks_cluster_domain" {
  type        = string
  description = "EKS cluster domain."
  default     = ""
}

variable "cluster_name" {
  type        = string
  description = "ID for the EKS Cluster."
  default     = ""
}

variable "rancher_bootstrap_password" {
  type        = string
  description = "Rancher bootstrap pasword."
  default     = ""
}

variable "lets_encrypt_email" {
  type        = string
  description = "Email for Lets Encrypt."
  default     = ""
}
