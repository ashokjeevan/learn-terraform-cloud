output "log_groups" {
    description = "Log groups in the account"
    value = data.aws_cloudwatch_log_groups.test.log_group_names
}