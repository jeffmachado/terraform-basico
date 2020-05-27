provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "main" {
  // Aqui você define o pattern... Nesse exemplo é: time-ambiente-produto-aplicacao 
  bucket = "labtrack-dev-trackerpills-tfstate"

  tags = {
    "time"      = "labtrack"
    "produto"   = "trackerpills"
    "aplicacao" = "tfstate"
    "ambiente"  = "dev"
  }
}