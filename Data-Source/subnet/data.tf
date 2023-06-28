#data block the subnet
data "aws_subnet" "existing_subnet" {
  filter {
    name   = "tag:Name"
    values = [ "eu-west-3c-subnet" ]
  }
}
#security group
data "aws_security_group" "existing_security_group" {
  filter {
    name   = "tag:Name"
    values = [ "terraform_security_group" ]
  }
}
#key
data "aws_key_pair" "existing_key_pair" {
  key_name = var.ec2_key_name
}