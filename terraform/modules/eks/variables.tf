variable "name" {
  description = "El nombre base para los recursos de EKS"
  type        = string
}

variable "environment" {
  description = "El entorno para el cluster EKS, por ejemplo: 'dev', 'test', 'prod'"
  type        = string
}

variable "subnet_ids" {
  description = "Los IDs de las subredes para el cluster EKS y los nodos"
  type        = list(string)
}

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
