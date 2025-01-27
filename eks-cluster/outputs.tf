output "vpc_id" {
  value       = module.vpc.vpc_id
  sensitive   = true
  description = "The ID of the VPC"
}


output "public_subnets" {
  value       = module.vpc.public_subnets
  sensitive   = true
  description = "IDs of the public subnets"
}

output "private_subnets" {
  value       = module.vpc.private_subnets
  sensitive   = true
  description = "IDs of the private subnets"
}

output "cluster_name" {
  value       = module.eks.cluster_name
  description = "EKS Cluster Name"
}

output "cluster_endpoint" {
  value       = module.eks.cluster_endpoint
  description = "EKS Cluster Endpoint"
}
