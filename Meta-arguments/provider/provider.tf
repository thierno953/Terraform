# Default proivider configuration
provider "aws" {
  region  = var.ec2_region
}

# Alternate provider configuration
provider "aws" {
  alias  = "London"
  region = "eu-west-2"
}