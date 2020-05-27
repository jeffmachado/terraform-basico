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

locals {
  time      = "labtrack"
  produto   = "trackerpills"
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
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.nano"

  key_name = "trackerpills"

  tags = {
    "time"      = local.time
    "produto"   = local.produto
    "aplicacao" = local.aplicacao
    "ambiente"  = local.ambiente
  }
}