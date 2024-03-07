output "s3_bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.devops_devsu_bucket.bucket
}

output "bucket_id" {
  description = "ID of the S3 bucket"
  value       = aws_s3_bucket.devops_devsu_bucket.id
}


output "s3_bucket_arn" {
  value       = aws_s3_bucket.devops_devsu_bucket.arn
  description = "ARN of the S3 bucket"
}

