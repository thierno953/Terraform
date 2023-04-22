provider "aws" {
   region     = "eu-west-3"
}

resource "aws_instance" "example_instance" {  
  ami           = "ami-xxxxxxxxxxxxxxx" 
  instance_type = "t2.micro"           
}
  
variable "ec2_region" {
  type = string 
  default = "eu-west-3"
  description = "Specify the region where the resource will be created"
}

variable "ec2_instance_type" {
  type = string 
  default = "t2.micro"
  description = "Instance type to launch the instance"
}

variable "ec2_availability_zones" {
  type = list(string)
  default = ["eu-west-3a"]
}