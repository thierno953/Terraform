terraform {
  backend "s3" {
    bucket         = "dgruploads-terraform-state-file"
    key            = "terraform_state_file/terraform.tfstate"
    region         = "eu-west-3"
  }
}