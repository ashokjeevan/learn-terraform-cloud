// output "instance_ami" {
//   value = aws_instance.ubuntu.ami
// }

// output "instance_arn" {
//   value = aws_instance.ubuntu.arn
// }

output "result_from_lambda" {
    value = jsondecode(data.aws_lambda_invocation.lambda_invoke.result)["hi"]

    # value = data.aws_lambda_invocation.lambda_invoke.result
}