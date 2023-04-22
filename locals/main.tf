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

resource "aws_instance" "local_example" {  
  instance_type = "t2.micro"    
  ami           = "ami-xxxxxxxxxxxxxxx"

  tags          = local.common_tags
}

