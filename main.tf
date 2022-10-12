provider "aws" {
  region = var.region
}

# Fetch AMIs from account
data "aws_ami_ids" "windows_ami" {
  owners = ["self"]
  # sort_ascending = true

  for_each = var.ami_names

  filter {
    name = "name"
    values = [each.value]
  }
}

output "windows_ami_count_result" {
  value = "${length(data.aws_ami_ids.windows_ami.ids)}"
}

output "windows_ami_list_result" {
  value = data.aws_ami_ids.windows_ami.ids
}

// data "aws_ami" "ubuntu" {
//   most_recent = true

//   filter {
//     name   = "name"
//     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
//   }

//   filter {
//     name   = "virtualization-type"
//     values = ["hvm"]
//   }

//   owners = ["099720109477"] # Canonical
// }

// resource "aws_instance" "ubuntu" {
//   ami           = data.aws_ami.ubuntu.id
//   instance_type = var.instance_type

//   tags = {
//     Name = var.instance_name
//   }
// }
