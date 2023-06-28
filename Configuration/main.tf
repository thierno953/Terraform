resource "aws_instance" "example_one" {
  instance_type = var.ec2_instance_type
  ami           = var.example_one_ami
}

resource "aws_instance" "example_two" {
  instance_type = var.ec2_instance_type
  ami           = var.example_two_ami
}