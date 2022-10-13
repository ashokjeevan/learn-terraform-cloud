variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "ami_names" {
  description = "Various AMIs supported"
  type = list(string)
  default = ["linux*", "windowsv*"]
}

variable "ami_ssm_names" {
  description = "Names to be entered in the SSM Parameter Store"
  type = list(string)
  default = ["AMZN2","Windows2016"]
}

variable "ami_names_map" {
  description = "AMI names in a map structure"
  type = "map"
  default = {
    "AMZN2" = "linux*",
    "Windows2016" = "windowsv*"
  }
}

// variable "instance_type" {
//   description = "Type of EC2 instance to provision"
//   default     = "t2.micro"
// }

// variable "instance_name" {
//   description = "EC2 instance name"
//   default     = "Provisioned by Terraform"
// }

