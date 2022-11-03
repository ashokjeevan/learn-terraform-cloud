resource "aws_ssm_parameter" "ssm" {
    type = "String"
    for_each = var.ami_details
    name = "/something/${each.value}/id"
    value = each.key
    overwrite = true
}