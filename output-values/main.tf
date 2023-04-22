provider "aws" {
  region     = "eu-west-3"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}

resource "aws_instance" "ec2_exemple" {
  ami           = "ami-xxxxxxxxxxxxxxxxx"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform EC2"
  }
}

output "my_console_output" {
  value = aws_instance.ec2_exemple.public_ip
  description  = "The public IP of the EC2 instance"
  sensitive = true
}