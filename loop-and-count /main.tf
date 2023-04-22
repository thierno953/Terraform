// ========================== // list

provider "aws" {
  region     = "eu-west-3"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}

resource "aws_instance" "ec2_exemple" {
  ami           = "ami-xxxxxxxxxxxxxxxxx"
  instance_type = "t2.micro"
  count         = 1  

  tags = {
    Name = "Terraform EC2"
  }
}

resource "aws_iam_user" "example" {
  count = length(var.user_names)
  name  = var.user_names[count.index]
}

variable "user_names" {
  description = "IAM usernames"
  type        = list(string)
  default     = ["user1", "user2", "user3"]
}

output "my_console_output" {
  value = aws_instance.ec2_exemple.public_ip
  description  = "The public IP of the EC2 instance"
  sensitive = true
}

// ========================== // for_each

provider "aws" {
  region     = "eu-west-3"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}

resource "aws_instance" "ec2_exemple" {
  ami           = "ami-xxxxxxxxxxxxxxxxx"
  instance_type = "t2.micro"
  count         = 1  

  tags = {
    Name = "Terraform EC2"
  }
}

resource "aws_iam_user" "example" {
  for_each = var.user_names
  name     = each.value
}

variable "user_names" {
  description = "IAM usernames"
  type        = set(string)
  default     = ["user1", "user2", "user3"]
}

output "my_console_output" {
  value        = aws_instance.ec2_exemple.public_ip
  description  = "The public IP of the EC2 instance"
  sensitive    = true
}

// ========================== // loop

provider "aws" {
  region     = "eu-west-3"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}

resource "aws_instance" "ec2_exemple" {
  ami           = "ami-xxxxxxxxxxxxxxxxx"
  instance_type = "t2.micro"
  count         = 1  

  tags = {
    Name = "Terraform EC2"
  }
}

output "print_the_names" {
  value = [for name in var.user_names : name]
}

variable "user_names" {
  description = "IAM usernames"
  type        = list(string)
  default     = ["user1", "user2", "user3"]
}

