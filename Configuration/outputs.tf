output "instance_one_public_ip" {
  value = aws_instance.example_one.public_ip
}

output "instance_two_public_ip" {
  value = aws_instance.example_two.public_ip
}
