output "container_name" {
  value = aws_ecr_repository.main.name
}

output "container_image_url" {
  value = aws_ecr_repository.main.repository_url
}

output "ecr_repository_arn" {
  value       = aws_ecr_repository.main.arn
  description = "ARN of the ECR repository"
}
