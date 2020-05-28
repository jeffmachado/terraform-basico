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
    values = ["CentOS Linux 7 x86_64 HVM EBS ENA 2002_01*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["679593333241"] # CentOS
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