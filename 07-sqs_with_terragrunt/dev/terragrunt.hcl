remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "terraform-dev-basic-example-tfstate"

    key = "us-east-1/terraform/dev/${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
  }
}