terraform {
  required_version = "~> 1.6"

  backend "s3" {
    bucket         = "tmb-tf-state-backend"
    key            = "tf-infra/terraform.tfstate"
    region         = "eu-west-3"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "tf-state" {
  source      = "./modules/tf-state.tf"
  bucket_name = local.bucket_name
  table_name  = local.table_name
}

