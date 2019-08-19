variable "region" {
  default = "eu-west-1"
}


provider "aws" {
  # ... other configuration ...
  version = "~> 2.0"
  region  = "${var.region}"
}

# AMIs
data "aws_ami" "amaoznlinux" {
    owners = ["amazon"]
    most_recent = true
    filter {
        name = "name"
        values = ["amzn-ami-hvm-*-x86_64-gp2"]
    }
}

data "aws_ami" "amazonlinux2" {
    owners = ["amazon"]
    most_recent = true
    filter {
        name = "name"
        values = ["amzn2-ami-hvm-2.0.*-x86_64-gp2"]
    }
}

data "aws_ami" "ubuntu-xenial1604" {
  owners = ["099720109477"]
  most_recent = true
  filter {
      name = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }
}

data "aws_ami" "ubuntu-bionic1804" {
  owners = ["099720109477"]
  most_recent = true
  filter {
      name = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}

data "aws_ami" "Redhat8" {
  owners = ["309956199498"]
  most_recent = true
  filter {
      name = "name"
      values = ["RHEL-8.0.0_HVM-*-x86_64-1-Hourly2-GP2"]
  } 
}


output "rhel8" {
  value = "${data.aws_ami.Redhat8.id}"
}

output "amazonlinux" {
  value = "${data.aws_ami.amaoznlinux.id}"
}

output "amazonlinux2" {
  value = "${data.aws_ami.amazonlinux2.id}"
}

output "ubuntuxenial" {
  value = "${data.aws_ami.ubuntu-xenial1604.id}"
}

output "ubuntubionix" {
  value = "${data.aws_ami.ubuntu-bionic1804.id}"
}
