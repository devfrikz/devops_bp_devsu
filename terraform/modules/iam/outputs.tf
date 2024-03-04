output "eks_role_arn" {
  value       = aws_iam_role.eks_role.arn
  description = "ARN of the IAM role for EKS"
}

output "eks_policy_name" {
  value       = aws_iam_role_policy.eks_ecr_s3_policy.name
  description = "Name of the policy attached to the EKS IAM role"
}

output "eks_node_role_arn" {
  value = aws_iam_role.eks_node_role.arn
}

output "node_role_arn" {
  description = "ARN of the IAM role for EKS nodes"
  value       = aws_iam_role.eks_node_role.arn
}
