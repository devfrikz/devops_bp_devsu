output "vpc_id" {
  value = aws_vpc.devops_devsu_vpc.id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = aws_subnet.devops_devsu_subnets[*].id
}


output "vpc_endpoint_id_s3" {
  description = "ID of the VPC Endpoint for S3"
  value       = aws_vpc_endpoint.devops_devsu_s3_endpoint.id
}


