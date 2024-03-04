variable "environment" {
  description = "Environment for the S3 bucket"
  type        = string
}

variable "vpc_endpoint_id_s3" {
  description = "VPC Endpoint ID for S3"
  type        = string
}
