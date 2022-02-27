
variable "vpc_name" {
  type        = string
  description = "Name for the VPC."
  default     = ""
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR for the VPC."
  default     = "10.0.0.0/16"
}

variable "cluster_name" {
  type        = string
  description = "ID for the EKS Cluster."
  default     = ""
}
