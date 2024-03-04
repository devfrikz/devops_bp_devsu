resource "aws_eks_cluster" "devops_devsu_eks" {
  name     = "${var.name}-eks-${var.environment}"
  role_arn = var.role_arn
  vpc_config {
    subnet_ids = var.subnet_ids
  }


}

resource "aws_eks_node_group" "devops_devsu_eks_nodes" {
  cluster_name    = aws_eks_cluster.devops_devsu_eks.name
  node_group_name = "${var.name}-eks-node-group-${var.environment}"
  # node_role_arn   = aws_iam_role.eks_node_role.arn
  node_role_arn = var.node_role_arn
  subnet_ids    = var.subnet_ids

  scaling_config {
    desired_size = var.node_group_desired_capacity
    max_size     = var.node_group_max_size
    min_size     = var.node_group_min_size
  }

  depends_on = [
    aws_eks_cluster.devops_devsu_eks,
  ]
}
