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

# SSM Parameter Store creation based on the output of the lambda invocation
# module "ssm_parameter_creation" {
#     source = "./modules/ssm-parameters"

#     ami_details = local.lambda_result
# }