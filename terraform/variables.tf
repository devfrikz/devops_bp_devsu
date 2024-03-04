# Variables principales

variable "name" {
  description = "El nombre base para los recursos, utilizado en varios módulos."
  type        = string
}

variable "environment" {
  description = "El entorno de despliegue, por ejemplo: 'dev', 'test', 'prod'."
  type        = string
}

# Variables para EKS

variable "node_group_desired_capacity" {
  description = "El número deseado de instancias EC2 en el grupo de nodos"
  type        = number
}

variable "node_group_max_size" {
  description = "El número máximo de instancias EC2 en el grupo de nodos"
  type        = number
}

variable "node_group_min_size" {
  description = "El número mínimo de instancias EC2 en el grupo de nodos"
  type        = number
}

# Variables para VPC

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

# Variables para Security Group (SG)



# Variables para IAM

variable "cluster_name" {
  type        = string
  description = "The name of the EKS cluster"
}

