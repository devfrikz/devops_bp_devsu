

variable "cluster_name" {
  type        = string
  description = "The name of the EKS cluster"
}

variable "environment" {
  type        = string
  description = "Deployment environment"
}

variable "s3_arn" {
  type        = string
  description = "The ARN of the S3 bucket"
}

variable "ecr_repository_arn" {
  type        = string
  description = "The ARN of the ECR repository"
}
