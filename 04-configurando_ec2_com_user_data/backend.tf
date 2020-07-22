provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-dev-basic-example-tfstate"
    key    = "us-east-1/terraform/dev/basic-example/webserver/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "ami_padrao" {
  backend = "s3"

  config = {
    bucket = "terraform-dev-basic-example-tfstate"
    key    = "us-east-1/terraform/dev/basic-example/ami_padrao/terraform.tfstate"
    region = "us-east-1"
  }
}