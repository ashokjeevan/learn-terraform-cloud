data "aws_cloudwatch_log_groups" "test" {
  log_group_name_prefix = "/aws/codebuild/helloworld"
}