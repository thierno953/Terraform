provider "aws" {
  shared_config_files      = [ "/home/ubuntu/.aws/conf" ]
  shared_credentials_files = [ "/home/ubuntu/.aws/creds" ]
  profile                  = "customprofile"
  region                   = "eu-west-3" 
}

resource "aws_instance" "example_instance" {  
  ami           = "ami-xxxxxxxxxxxxxxx" 
  instance_type = "t2.micro"            
}