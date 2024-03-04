provider "aws" {
  profile = "test_user"
  region  = var.region
}
module "vpc" {
  source         = "./modules/vpc"
  name           = var.name
  environment    = var.environment
  vpc_cidr       = var.vpc_cidr
  public_subnets = var.public_subnets
  region         = var.region
}

module "security_group" {
  source = "./modules/security-group"
  vpc_id = module.vpc.vpc_id
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
}

module "iam" {
  source             = "./modules/iam"
  cluster_name       = var.cluster_name
  environment        = var.environment
  s3_arn             = module.s3.s3_bucket_arn
  ecr_repository_arn = module.ecr.ecr_repository_arn
}

module "eks" {
  source               = "./modules/eks"
  name                 = var.name
  environment          = var.environment
  subnet_ids           = module.vpc.public_subnet_ids
  eks_cluster_role_arn = module.iam.eks_role_arn
}

module "ecr" {
  source      = "./modules/ecr"
  name        = var.name
  environment = var.environment
}
