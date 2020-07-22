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

locals {
  time      = "terraform"
  produto   = "basic-example"
  aplicacao = "webserver"
  ambiente  = "dev"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ############# OBS
  # Recomendo análise das AMIs antes de implantar em seu ambiente.
  
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.nano"

  key_name = "basic-example"

  tags = {
    "time"      = local.time
    "produto"   = local.produto
    "aplicacao" = local.aplicacao
    "ambiente"  = local.ambiente
  }
}