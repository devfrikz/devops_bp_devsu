variable "name" {
  description = "El nombre base para los recursos"
  type        = string
}

variable "vpc_id" {
  description = "El ID de la VPC donde se desplegará el ALB"
  type        = string
}

variable "subnet_ids" {
  description = "Los IDs de las subnets donde el ALB será accesible"
  type        = list(string)
}

variable "alb_sg_id" {
  description = "The ID of the Security Group for the ALB"
  type        = string
}
