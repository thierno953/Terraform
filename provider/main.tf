provider "aws" {
  region     = "eu-west-3"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}

        #resource type       #local name
resource "aws_instance" "example_instance" {  
  ami           = "ami-xxxxxxxxxxxxxxx"         # Public IP
  instance_type = "t2.micro"                    # Instance Id
}