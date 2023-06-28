variable "ec2_region" {
  type        = string
  description = "Specify the region to create the resources"
}

variable "example_one_ami" {
  type        = string
  description = "Specify the AMI to the first instance"
}

variable "example_two_ami" {
  type        = string
  description = "Specify the AMI to the second instance"
}

variable "ec2_instance_type" {
  type        = string
  description = "Specify the instance type for the instance"
}