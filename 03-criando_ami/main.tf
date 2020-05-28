locals {
  time      = "labtrack"
  produto   = "trackerpills"
  aplicacao = "webserver"
  ambiente  = "dev"
}

resource "aws_ami_from_instance" "ami_padrao" {
  name               = "${local.time}-${local.ambiente}-${local.produto}-${local.aplicacao}-ami-padrao-01"
  source_instance_id = data.terraform_remote_state.webserver.outputs.instance_id

  tags = {
    "time"      = local.time
    "produto"   = local.produto
    "aplicacao" = local.aplicacao
    "ambiente"  = local.ambiente
  }
}