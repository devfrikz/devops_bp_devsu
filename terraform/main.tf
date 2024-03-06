provider "aws" {
  profile = "devsu"
  region  = var.region
}

module "ecr" {
  source      = "./modules/ecr"
  name        = var.name
  environment = var.environment
}


module "eks" {
  source                      = "./modules/eks"
  name                        = var.name
  environment                 = var.environment
  subnet_ids                  = module.vpc.public_subnet_ids
  cluster_name                = var.cluster_name
  role_arn                    = module.iam.eks_role_arn
  node_role_arn               = module.iam.eks_node_role_arn
  node_group_desired_capacity = var.node_group_desired_capacity
  node_group_max_size         = var.node_group_max_size
  node_group_min_size         = var.node_group_min_size
}

# Comenta o elimina temporalmente el data source y el proveedor de Kubernetes
#data "aws_eks_cluster" "cluster" {
#  name = module.eks.cluster_name
#}

#data "aws_eks_cluster_auth" "cluster" {
# name = module.eks.cluster_name
#}

#provider "kubernetes" {
# host                   = data.aws_eks_cluster.cluster.endpoint
# token                  = data.aws_eks_cluster_auth.cluster.token
# cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)
#}





module "vpc" {
  source         = "./modules/vpc"
  name           = var.name
  environment    = var.environment
  vpc_cidr       = var.vpc_cidr
  public_subnets = var.public_subnets
  region         = var.region
}

module "sg" {
  source         = "./modules/sg"
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnet_ids
}



module "iam" {
  source             = "./modules/iam"
  cluster_name       = var.cluster_name
  environment        = var.environment
  s3_arn             = module.s3.s3_bucket_arn
  ecr_repository_arn = module.ecr.ecr_repository_arn
  node_role_arn      = module.iam.node_role_arn
}




module "s3" {
  source             = "./modules/s3"
  environment        = var.environment
  vpc_endpoint_id_s3 = module.vpc.vpc_endpoint_id_s3
}

module "lb" {
  source     = "./modules/lb"
  name       = var.name
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id  = module.sg.security_group_id
}

