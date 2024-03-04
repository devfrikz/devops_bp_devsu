output "ecr_repository_url" {
  description = "El URL del repositorio ECR"
  value       = aws_ecr_repository.devops_devsu_ecr.repository_url
}
