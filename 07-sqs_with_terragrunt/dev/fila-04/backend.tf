# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "s3" {
    region = "us-east-1"
    bucket = "terraform-dev-basic-example-tfstate"
    key    = "us-east-1/terraform/dev/fila-04/terraform.tfstate"
  }
}
