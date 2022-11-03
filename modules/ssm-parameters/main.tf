resource "aws_ssm_paramter" "ssm" {
    for_each = var.ami_details
    name = "/something/${each.key}/id"
    value = each.value
    overwrite = true
}