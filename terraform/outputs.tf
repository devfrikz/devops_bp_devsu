output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "eks_cluster_endpoint" {
  value = module.eks.eks_cluster_endpoint
}

output "eks_cluster_id" {
  value = module.eks.eks_cluster_id
}

output "ecr_repository_url" {
  value = module.ecr.ecr_repository_url
}

# Define outputs adicionales según sea necesario
