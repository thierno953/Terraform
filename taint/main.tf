resource "aws_instance" "replace_example_one" {
  ami           = var.ec2_image_one
  instance_type = var.ec2_instance_type
  
  tags          = local.common_tags
}

resource "aws_instance" "replace_example_two" {
  ami           = var.ec2_image_two
  instance_type = var.ec2_instance_type
  
  tags          = local.common_tags
}

# Syntax : terraform taint [options] <address>

# example command :  terraform taint aws_instance.taint_example_two

# example alternative :  terraform apply --replace="aws_instance.replace_example_one"

