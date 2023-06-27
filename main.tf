 # configure aws provider
provider "aws" {
    region = "us-east-1"
    profile = "terraform-user"
 }

# store terraform state file in s3
terraform {
  backend "s3" {
    bucket = "terraform-s3-bucket-khalil"
    key = "terraform.tfstate.dev"
    region = "us-east-1"
    profile = "terraform-user"
  }
}