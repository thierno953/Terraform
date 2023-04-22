variable "ec2_region" {
  description = "Specify the region for the resources"
  type        = string  
}

variable "ec2_image" {
  description = "Specify the AMI for the EC2"
  type        = string 
}

variable "ec2_instance_type" {
  description = "Specify the instance for the EC2"
  type        = string 
}