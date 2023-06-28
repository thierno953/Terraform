provider "aws" {
  region = "eu-west-3"
}

resource "aws_instance" "outputs_instance" {
  instance_type = "t2.micro"
  ami           = "ami-05b5a865c3579bbc4"
}

output "instance_private_ip" {
  value       = aws_instance.outputs_instance.private_ip
  description = "The private IP of the EC2 instance"
  sensitive   = true
}

output "instance_public_ip" {
  value       = aws_instance.outputs_instance.public_ip
  description = "The public IP of the EC2 instance"
  sensitive   = true
}
