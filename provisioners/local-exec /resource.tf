resource "aws_instance" "local_exec_example" {
  instance_type = var.ec2_instance_type
  ami           = var.ec2_image 
  tags          = local.common_tags

  provisioner "local-exec" {
    command = "echo self.private_ip >> private_IPs.txt"
  }

  provisioner "local-exec" {
    command = "echo self.public_ip >> public_IPs.txt"
  }
}