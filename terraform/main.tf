# Define the provider and version
terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "3.56.0"
        }
    }
}

# Configure the AWS provider
provider "aws" {
    region = "us-west-2"
}

# Include modules
module "ecr" {
    source = "./modules/ecr"
}

module "eks" {
    source = "./modules/eks"
}

module "iam" {
    source = "./modules/iam"
}

module "s3" {
    source = "./modules/s3"
}

module "vpc" {
    source = "./modules/vpc"
}

module "security-group" {
    source = "./modules/security-group"
}

# Include main outputs
output "main_outputs" {
    value = module.ecr.main_output
}

# Include main variables
variable "main_variable" {
    type    = string
    default = "example"
}