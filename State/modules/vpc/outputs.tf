output "tf_vpc_id" {
  description = "VPC Id"
  value       = aws_vpc.tfVPC.id
}

output "tf_public_subnets" {
  description = "Will be used by Web Server Module to set subnet_ids"
  value = [
    aws_subnet.tfPublicSubnet1,
    aws_subnet.tfPublicSubnet2
  ]
}

output "tf_private_subnets" {
  description = "Will be used by RDS Module to set subnet_ids"
  value = [
    aws_subnet.tfPrivateSubnet1,
    aws_subnet.tfPrivateSubnet2
  ]
}
