// output "instance_ami" {
//   value = aws_instance.ubuntu.ami
// }

// output "instance_arn" {
//   value = aws_instance.ubuntu.arn
// }

output "from_lamda" {
    # value = jsondecode(data.aws_lambda_invocation.lambda_invoke.result)["body"]
    value = data.aws_lambda_invocation.lambda_invoke.result
}