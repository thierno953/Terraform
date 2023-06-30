terraform {
  backend "s3" {
    bucket = "thiernos-terraform-state-file"  
    key    = "terraform_state_file/terraform.tfstate" 
    region = "eu-west-3"
  }
}