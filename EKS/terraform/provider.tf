locals {
  region          = "eu-west-3"
  name            = "tfcloud-cluster"
  vpc_cidr        = "10.123.0.0/16"
  azs             = ["eu-west-3a", "eu-west-3b"]
  public_subnets  = ["10.123.1.0/24", "10.123.2.0/24"]
  private_subnets = ["10.123.3.0/24", "10.123.4.0/24"]
  intra_subnets   = ["10.123.5.0/24", "10.123.6.0/24"]

  tags = {
    Example = local.name
  }
}

provider "aws" {
  region  = "eu-west-3"
  profile = "default"
}
