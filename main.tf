module "lambda_invoke" {
  source = "./modules/lambda"
}

locals {
  lambda_result = module.lambda_invoke.result_from_lambda
}

output "results" {
  value = local.lambda_result
}

provider "aws" {
  region = var.region
}