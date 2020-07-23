module "sqs-01" {
  source = "../../terraform-modules/sqs-example"

  time      = "terraform"
  produto   = "basic-example"
  aplicacao = "fila-01"
  ambiente  = "dev"
}

module "sqs-02" {
  source = "../../terraform-modules/sqs-example"

  time      = "terraform"
  produto   = "basic-example"
  aplicacao = "fila-02"
  ambiente  = "dev"

  deadLetterTargetArn = module.sqs_dead.arn
}

module "sqs_dead" {
  source = "../../terraform-modules/sqs-example"

  name      = "terraform-dead-queue-example"
  time      = "terraform"
  produto   = "basic-example"
  aplicacao = "dead"
  ambiente  = "dev"
}