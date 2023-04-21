provider "aws" {
  region     = "eu-west-3"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}

resource "aws_instance" "ec2_example" {
  ami           = "ami-xxxxxxxxxxxxxxxxx"
  instance_type = var.instance_type                   

  tags = {
    Name = var.environment_name
  }
}


