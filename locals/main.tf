provider "aws" {
  region     = "eu-west-3"
}

locals {
  name    = "locals_example"
  project = "locals_project"
  owner   = "locals"
}

locals {
  common_tags = {
    Name     = local.name
    Project  = local.project
    Owner    = local.owner
  }
}

resource "aws_instance" "locals_example" {  
  instance_type = "t2.micro"    
  ami           = "ami-05b5a865c3579bbc4"

  tags          = local.common_tags
}