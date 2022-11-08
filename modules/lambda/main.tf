# Fetch AMIs from account - this works
// data "aws_ami_ids" "windows_ami" {
//   owners = ["self"]
//   # sort_ascending = true

//   // for_each = var.ami_names

//   count = length(var.ami_names)

//   filter {
//     name = "name"
//     values = [var.ami_names[count.index]]
//   }
// }

// output "windows_ami_list_result" {
//   value = data.aws_ami_ids.windows_ami[*].ids
// }
//Works till here

# data "aws_ami_ids" "ami_ids" {
#   owners = ["self"]

#   for_each = var.ami_names_map

#   filter {
#     name = "name"
#     values = [each.value]
#   }
# }

# locals {
#   ami_results = {for k, v in data.aws_ami_ids.ami_ids: k => v.ids if v != []}
# }

# output "local_values" {
#   value = local.ami_results
# }


# locals {
#   sample_results = var.sample_map
# }

# output "sample_result" {
#   value = local.sample_results
# }

#SSM Parameter Store creation
// resource "aws_ssm_parameter" "ssm_parameters_ami_ids" {
//   for_each = local.ami_results

//   name = "/tec/golden-ami/${each.key}/ami_id"
//   type = "String"
//   value = each.value[0]

//   data_type = "aws:ec2:image"
// }


data "aws_lambda_invocation" "lambda_invoke"  {
  function_name = "arn:aws:lambda:us-east-1:175975633202:function:testLambda"
  input = <<JSON
{
  "currentdate": "October282022"
}
JSON
}

# Lambda execution role creation

# IAM policy creation
resource "aws_iam_policy" "iam_policy" {
  name = "test_policy"
  policy = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "dynamodb:*"
      ],
      "Resource": "arn:aws:dynamodb:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:table/*"
    },
    {
      "Action": [
        "logs:CreateLogGroup"
      ],
      "Resource": "*"
    }
  ]
}EOT
}