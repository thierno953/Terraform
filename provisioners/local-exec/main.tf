provider "aws" {
  region     = var.ec2_region
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}

resource "aws_instance" "local_exec_example" {
  ami                    = var.ec2_image
  instance_type          = var.ec2_instance_type
  tags                   = local.common_tags

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_IPs.txt"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_IPs.txt"
  }
}
