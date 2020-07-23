module "sqs" {
  source = "git::https://github.com/jeffmachado/terraform-modules.git//sqs-example?ref=v0.1"
  
  time      = "terraform"
  produto   = "basic-example"
  aplicacao = "fila-03"
  ambiente  = "dev"
}