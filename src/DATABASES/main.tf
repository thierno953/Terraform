terraform {
  required_version = "~> 1.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "tmbVPC" {
  source = "./modules/vpc"

  vpc_cidr             = local.vpc_cidr
  vpc_tags             = var.vpc_tags
  availability_zones   = local.availability_zones
  public_subnet_cidrs  = local.public_subnet_cidrs
  private_subnet_cidrs = local.private_subnet_cidrs
}

module "db" {
  source = "./modules/db"

  tmb_vpc_id               = module.tmbVPC.vpc_id
  tmb_private_subnets      = module.tmbVPC.private_subnets
  tmb_private_subnet_cidrs = local.private_subnet_cidrs

  db_az            = local.availability_zones[0]
  db_name          = "tmbDatabaseInstance"
  db_user_name     = var.db_user_name
  db_user_password = var.db_user_password
}
