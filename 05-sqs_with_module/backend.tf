provider "aws" {
  region = "us-east-1"
}

# terraform {
#   backend "s3" {
#     bucket = "terraform-dev-basic-example-tfstate"
#     key    = "us-east-1/terraform/dev/basic-example/queues/terraform.tfstate"
#     region = "us-east-1"
#   }
# }