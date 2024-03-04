output "eks_cluster_id" {
  description = "El ID del cluster EKS"
  value       = aws_eks_cluster.devops_devsu_eks.id
}

output "eks_cluster_endpoint" {
  description = "El endpoint del cluster EKS"
  value       = aws_eks_cluster.devops_devsu_eks.endpoint
}

output "eks_cluster_certificate_authority_data" {
  description = "Los datos de la autoridad certificadora del cluster EKS"
  value       = aws_eks_cluster.devops_devsu_eks.certificate_authority[0].data
}
