provider "aws" {
  region     = var.ec2_region
}

resource "aws_instance" "example_instance" {  
  instance_type = var.ec2_instance_type       
  ami           = var.ec2_image_id
}
  
variable "ec2_region" {
  type        = string 
  default     = "eu-west-3"
  description = "Specify the region where the resource will be created"
}

variable "ec2_instance_type" {
  type        = string 
  default     = "t2.micro"
  description = "Instance type to launch the instance"
}

variable "ec2_image_id" {
  type        = string 
  default     = "ami-xxxxxxxxxxxxxxx"
  description = "AMI to use when launching the instance"
}
