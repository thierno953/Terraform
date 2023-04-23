resource "aws_instance" "example_instance" {
  instance_type = var.ec2_instance_type
  ami           = var.ec2_ami
 # count         = 2

  tags          = local.common_tags
}

resource "null_resource" "null_resource_example_one" {
  provisioner "local-exec" {
    command = "echo ${aws_instance.example_instance.private_ip} >> private_ips.txt"
  }
}

resource "null_resource" "null_resource_example_two" {
  provisioner "local-exec" {
    command = "echo ${aws_instance.example_instance.public_ip} >> public_ips.txt"
  }
}

/* resource "null_resource" "example_instance" {
  # Changes to any instance of cluster will require re-provisioning.
  triggers = {
        cluster_instance_ids = "${join(",", aws_instance.example_instance.*.id)}"
  }
} */