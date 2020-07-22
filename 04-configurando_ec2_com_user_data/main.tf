locals {
   time      = "terraform"
   produto   = "basic-example"
   aplicacao = "webserver"
   ambiente  = "dev"
}

resource "aws_instance" "web" {
  ami           =  data.terraform_remote_state.ami_padrao.outputs.ami_id
  instance_type = "t2.nano"

  key_name = "basic-example"

  user_data = data.template_file.user_data_file.rendered

  tags = {
    "time"      = local.time
    "produto"   = local.produto
    "aplicacao" = local.aplicacao
    "ambiente"  = local.ambiente
  }
}

data "template_file" "user_data_file" {
  template = file("${path.module}/files/user_data")
}