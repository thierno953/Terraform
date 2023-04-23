# Default proivider configuration
provider "aws" {
  region  = var.ec2_region
}

# Alternate provider configuration
provider "aws" {
  alias  = "eu-west-2"
  region = "eu-west-2"
}