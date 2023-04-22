variable "ec2_region" {
  type = string
  description = "Specify the region for the resources"
}

variable "ec2_instance_type" {
  type = string
  description = "Specify the instance for EC2"
}

variable "ec2_image" {
  type = string
  description = "Specify the AMI for the EC2"
}
