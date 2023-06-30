terraform {
  backend "s3" {
    bucket         = "thiernos-terraform-state-file"
    key            = "terraform_state_file/terraform.tfstate"
    encrypt        = true 
    region         = "eu-west-3"
    dynamodb_table = "terraform_state_file_lock"
  }
}

