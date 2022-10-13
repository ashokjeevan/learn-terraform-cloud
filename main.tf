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

// output "ami_map_results" {
//   value = data.aws_ami_ids.ami_ids[each.key].ids
// }

output "test_map" {
  value = var.ami_names_map["AMZN2"]
}

output "ami_list_ids" {
  value = {for k, v in data.aws_ami_ids.ami_ids: k => v.ids}
}

#SSM Parameter Store creation
// resource "aws_ssm_paramter" "ssm_parameters_ami_ids" {


//   name = ""
//   type = "String"
//   value = ""
// }

