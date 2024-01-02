output "vpc_id" {
  value = aws_vpc.tmbVPC.id
}

output "public_subnets" {
  description = "Will be used by Web Server Module to set subnet_ids"
  value = [
    aws_subnet.tmbPublicSubnet1,
    aws_subnet.tmbPublicSubnet2
  ]
}
output "private_subnets" {
  description = "Will be used by RDS Module to set subnet_ids"
  value = [
    aws_subnet.tmbPrivateSubnet1,
    aws_subnet.tmbPrivateSubnet2
  ]
}
