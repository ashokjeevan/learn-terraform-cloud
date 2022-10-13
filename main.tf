provider "aws" {
  region = var.region
}

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

data "aws_ami_ids" "ami_ids" {
  owners = ["self"]

  for_each = var.ami_names_map

  filter {
    name = "name"
    values = [each.value]
  }
}

locals {
  ami_results = {for k, v in data.aws_ami_ids.ami_ids: k => v.ids}
}

output "local_values" {
  value = local.ami_results
}

#SSM Parameter Store creation
resource "aws_ssm_paramter" "ssm_parameters_ami_ids" {
  for_each = local.ami_results

  name = "/tec/golden-ami/${each.key}/ami_id"
  type = "String"
  value = each.key[0]

  data_type = "aws:ec2:image"
}

