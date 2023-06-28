provider "aws" {
  region  = "eu-west-3"    
  access_key = "AKIATH7A5UZVRZLS4R4Z"
  secret_key = "UEz+ZFTs9hpFhsxnKrbkrNJt4vsKBWrUR8ZfWNcA"
}

resource "aws_instance" "example_instance" {
  instance_type = "t2.micro"
  ami           = "ami-05b5a865c3579bbc4"
}