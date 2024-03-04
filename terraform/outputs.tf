# ECR

output "ecr_repository_url" {
  description = "El URL del repositorio ECR creado."
  value       = module.ecr.ecr_repository_url
}

# EKS

output "eks_cluster_id" {
  description = "El ID del cluster EKS creado."
  value       = module.eks.eks_cluster_id
}

output "eks_cluster_endpoint" {
  description = "El endpoint del cluster EKS."
  value       = module.eks.eks_cluster_endpoint
}

output "eks_cluster_certificate_authority_data" {
  description = "Los datos de la autoridad certificadora del cluster EKS."
  value       = module.eks.eks_cluster_certificate_authority_data
}

# VPC

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.vpc.public_subnet_ids
}

output "vpc_endpoint_id_s3" {
  description = "ID of the VPC Endpoint for S3"
  value       = module.vpc.vpc_endpoint_id_s3
}

# SG

output "security_group_id" {
  description = "ID of the security group created for EKS."
  value       = module.sg.security_group_id
}

# IAM

output "eks_role_arn" {
  description = "ARN of the IAM role for EKS"
  value       = module.iam.eks_role_arn
}

output "eks_policy_name" {
  description = "Name of the policy attached to the EKS IAM role"
  value       = module.iam.eks_policy_name
}

output "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = module.s3.s3_bucket_arn
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket"
  value       = module.s3.s3_bucket_name
}

output "bucket_id" {
  description = "ID of the S3 bucket"
  value       = module.s3.bucket_id
}

# LB

output "alb_arn" {
  description = "El ARN del Application Load Balancer"
  value       = module.lb.alb_arn
}

output "alb_dns_name" {
  description = "El DNS name del Application Load Balancer"
  value       = module.lb.alb_dns_name
}
