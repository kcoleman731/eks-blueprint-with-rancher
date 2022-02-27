output "vpc_id" {
  description = "ID for the VPC."
  value       = module.aws_vpc.vpc_id
}

output "private_subnets" {
  description = "Private subnets for the VPC."
  value       = module.aws_vpc.private_subnets
}
