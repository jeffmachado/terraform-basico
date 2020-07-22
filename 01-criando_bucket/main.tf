provider "aws" {
  region = "us-east-1"
  # shared_credentials_file = "/Users/tf_user/.aws/creds"
  # profile                 = "customprofile"
}

resource "aws_s3_bucket" "main" {
  // Aqui você define o pattern... Nesse exemplo é: time-ambiente-produto-aplicacao 
  bucket = "terraform-dev-basic-example-tfstate"

  tags = {
    "time"      = "terraform"
    "produto"   = "basic-example"
    "aplicacao" = "tfstate"
    "ambiente"  = "dev"
  }
}