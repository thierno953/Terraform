variable "aws_region" {
  description = "For Region"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  type        = string
}

variable "vpc_tags" {
  description = "Tags for VPC"
  type        = map(any)
}
