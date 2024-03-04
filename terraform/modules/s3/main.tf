resource "aws_s3_bucket" "devops_devsu_bucket" {
  bucket = lower("devops-devsu-bucket-${var.environment}")

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "devops_devsu_bucket_encryption" {
  bucket = aws_s3_bucket.devops_devsu_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_policy" "devops_devsu_bucket_policy" {
  bucket = aws_s3_bucket.devops_devsu_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:*",
        Resource = [
          aws_s3_bucket.devops_devsu_bucket.arn,
          "${aws_s3_bucket.devops_devsu_bucket.arn}/*"
        ],
        Condition = {
          StringEquals = {
            "aws:sourceVpce" = var.vpc_endpoint_id_s3
          }
        }
      }
    ]
  })
}
