provider "aws" {
   region     = "eu-west-3"
   access_key = "my-access-key"
   secret_key = "my-secret-key"
}

resource "aws_instance" "ec2_exemple" {
  ami           = "ami-xxxxxxxxxxxxxxx"
  instance_type = "t2.micro"                  

  tags = {
          Name = "Terraform EC2"
  }
}