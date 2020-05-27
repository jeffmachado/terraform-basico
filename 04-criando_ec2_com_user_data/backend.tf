provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "labtrack-dev-trackerpills-tfstate"
    key    = "us-east-1/labtrack/dev/trackerpills/webserver/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "ami_padrao" {
  backend = "s3"

  config = {
    bucket = "labtrack-dev-trackerpills-tfstate"
    key    = "us-east-1/labtrack/dev/trackerpills/ami_padrao/terraform.tfstate"
    region = "us-east-1"
  }
}