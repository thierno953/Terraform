// ========================== // string
provider "aws" {
  region     = "eu-west-3"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}

// Declare variable
resource "aws_instance" "ec2_example" {
  ami           = "ami-xxxxxxxxxxxxxxxxx"
  instance_type = var.instance_type                   

  tags = {
    Name = "Terraform EC2"
  }
}

 // Define variable 
variable "instance_type" {                                                     
  description = "instance type t2.micro"                
  type        = string                                  
  default     = "t2.micro"                              
}


// ========================== // number
provider "aws" {
  region     = "eu-west-3"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}

// Declare variable
resource "aws_instance" "ec2_example" {
  ami           = "ami-xxxxxxxxxxxxxxxxx"
  instance_type = "t2.micro"
  count         = var.instance_count            

  tags = {
    Name = "Terraform EC2"
  }
}

 // Define variable 
variable "instance_count" {
  description = "EC2 instance count"
  type        = number
  default     = 2
}

// ========================== // boolean
provider "aws" {
  region     = "eu-west-3"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}

// Declare variable
resource "aws_instance" "ec2_example" {
  ami           = "ami-xxxxxxxxxxxxxxxxx"
  instance_type = "t2.micro"
  count         = 1
  associate_public_ip_address = var.enable_public_ip

  tags = {
    Name = "Terraform EC2"
  }
}

 // Define variable 
variable "enable_public_ip" {
  description = "Enable public IP address"
  type        = bool
  default     = true
}

// ========================== // list
provider "aws" {
  region     = "eu-west-3"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}

// Declare variable
resource "aws_instance" "ec2_example" {
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

 // Define variable 
variable "user_names" {
  description = "IAM usernames"
  type        = list(string)
  default     = ["user1", "user2", "user3"]
}

// ========================== // map
provider "aws" {
  region     = "eu-west-3"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}

// Declare variable
resource "aws_instance" "ec2_example" {
  ami           = "ami-xxxxxxxxxxxxxxxxx"
  instance_type = "t2.micro"

  tags          = var.project_environment
}

 // Define variable 
variable "project_environment" {
  description = "project name and environment"
  type        = map(string)
  default     = {
    project     = "project-alpha",
    environment = "dev"
  }
}