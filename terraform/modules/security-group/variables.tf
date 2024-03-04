variable "vpc_id" {
  description = "The VPC ID where the security group will be created"
  type        = string
}

variable "public_subnets" {
  description = "A list of CIDRs for public subnets in your VPC."
  type        = list(string)
}

