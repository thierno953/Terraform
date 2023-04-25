        #resource type    #local name
resource "aws_instance" "example_instance" {  
  ami           = "ami-xxxxxxxxxxxxxxx" # Public IP
  instance_type = "t2.micro"            # Instance Id
}