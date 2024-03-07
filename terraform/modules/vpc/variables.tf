variable "name" {
  description = "The name of your stack, e.g. 'devops_devsu'"
  type        = string
}

variable "environment" {
  description = "The name of your environment, e.g. 'prod'"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "public_subnets" {
  description = "A list of CIDRs for public subnets in your VPC."
  type        = list(string)
}

variable "region" {
  description = "The AWS region."
  type        = string
}

