module "sns" {
  source = "git::https://github.com/jeffmachado/terraform-modules.git//sns-example?ref=v0.1"

  time      = "terraform"
  produto   = "basic-example"
  aplicacao = "sns"
  ambiente  = "dev"

  subscribers = {
      "arn:aws:sqs:us-east-1:${data.aws_caller_identity.current.account_id}:terraform-basic-example-fila-01-dev" = {
          protocol = "sqs"
      }
      "arn:aws:sqs:us-east-1:${data.aws_caller_identity.current.account_id}:terraform-basic-example-fila-02-dev" = {
          protocol = "sqs"
      }
    }
}

data "aws_caller_identity" "current" {}