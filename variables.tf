variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "ami_names" {
  description = "Various AMIs supported"
  type = list(string)
  default = ["linux*", "windowsv*"]
}

// variable "instance_type" {
//   description = "Type of EC2 instance to provision"
//   default     = "t2.micro"
// }

// variable "instance_name" {
//   description = "EC2 instance name"
//   default     = "Provisioned by Terraform"
// }

