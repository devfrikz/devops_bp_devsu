variable "name" {
  description = "El nombre base para los recursos de ECR"
  type        = string
}

variable "environment" {
  description = "El entorno para el repositorio ECR, por ejemplo: 'dev', 'test', 'prod'"
  type        = string
}
