resource "aws_ecr_repository" "main" {
  name = "${var.name}-ecr-repository-${var.environment}"

  image_scanning_configuration {
    scan_on_push = false
  }
}
