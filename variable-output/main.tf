provider "aws" {
  region     = "eu-west-3"
}

resource "aws_instance" "example_instance" {  
  instance_type = "t2.micro"    
  ami           = "ami-xxxxxxxxxxxxxxx"
}

output "instance_private_ip" {
  value       = aws_instance.example_instance.private_ip
  description = "The private IP of the EC2 instance"
  sensitive   = true
}

output "instance_public_ip" {
  value       = aws_instance.example_instance.public_ip
  description = "The public IP of the EC2 instance"
  sensitive   = true
}