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

# Asumiendo que ya tienes un Security Group definido para el ALB
variable "alb_sg" {
  description = "El ID del Security Group asignado al ALB"
  type        = string
}
