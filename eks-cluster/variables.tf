variable "tenant" {
  type        = string
  description = "ID for the EKS Cluster."
  default     = ""
}

variable "environment" {
  type        = string
  description = "ID for the EKS Cluster."
  default     = ""
}

variable "zone" {
  type        = string
  description = "ID for the EKS Cluster."
  default     = ""
}

variable "kubernetes_version" {
  type        = string
  description = "Version for the EKS Cluster."
  default     = "1.21"
}

variable "vpc_id" {
  type        = string
  description = "ID for the VPC."
  default     = ""
}

variable "private_subnets" {
  type        = list(string)
  description = "Private subnets"
  default     = []
}

variable "cluster_domain" {
  type        = string
  description = "ID for the EKS Cluster."
  default     = ""
}
