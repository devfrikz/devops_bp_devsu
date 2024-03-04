variable "name" {
  type        = string
  description = "El nombre base para los recursos."
}

variable "environment" {
  type        = string
  description = "El entorno para la infraestructura, ej. 'dev', 'test', 'prod'."
}

variable "region" {
  type        = string
  description = "La región de AWS donde se desplegarán los recursos."
}

variable "vpc_cidr" {
  type        = string
  description = "El bloque CIDR para la VPC."
}

variable "public_subnets" {
  type        = list(string)
  description = "Una lista de bloques CIDR para las subredes públicas."
}

variable "cluster_name" {
  type        = string
  description = "El nombre del cluster EKS."
}

variable "subnet_ids" {
  type        = list(string)
  description = "Los IDs de las subredes para el cluster EKS y los nodos."
}

variable "node_group_desired_capacity" {
  type        = number
  description = "El número deseado de instancias EC2 en el grupo de nodos EKS."
}

variable "node_group_max_size" {
  type        = number
  description = "El número máximo de instancias EC2 en el grupo de nodos EKS."
}

variable "node_group_min_size" {
  type        = number
  description = "El número mínimo de instancias EC2 en el grupo de nodos EKS."
}

variable "alb_security_groups" {
  type        = list(string)
  description = "Lista de IDs de Security Groups asignados al ALB."
}

# Asumiendo que el módulo IAM necesita estas variables, las cuales no fueron explícitamente mencionadas antes
variable "eks_cluster_role_arn" {
  type        = string
  description = "ARN del rol de IAM para el cluster de EKS."
}

variable "s3_arn" {
  type        = string
  description = "El ARN del bucket de S3 utilizado."
}

variable "ecr_repository_arn" {
  type        = string
  description = "El ARN del repositorio ECR utilizado."
}

variable "vpc_endpoint_id_s3" {
  type        = string
  description = "ID del VPC Endpoint para S3."
}
