provider "aws" {
  region = var.region
}

# Fetch AMIs from account
data "aws_ami_ids" "windows_ami" {
  owners = ["self"]

  filter {
    name = "name"
    values = ["windows*"]
  }
}

output "windows_ami_result" {
  value = "${length(data.aws_ami_ids.windows_ami.ids)}"
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
