packer {
  required_plugins {
    aws = {
      version = "~> 1"
      source  = "github.com/hashicorp/amazon"
    }

    ansible = {
      version = "~> 1"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

variable "VPC_ID" {
  type = string
  default = env("VPC_ID")
}

variable "SUBNET_ID" {
  type = string
  default = env("SUBNET_ID")
}

source "amazon-ebs" "ubuntu" {
  ami_name                    = "packer-ami--${formatdate("YYYY-MM-DD-hh-mm-ss", timestamp())}"
  instance_type               = "t2.micro"
  region                      = "us-east-1"
  vpc_id                      =  var.VPC_ID
  subnet_id                   =   var.SUBNET_ID
  ssh_timeout                 = "20m"
  associate_public_ip_address = true
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-bionic-18.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}

build {
  name    = "ubuntu-ami"
  sources = ["source.amazon-ebs.ubuntu"]

  provisioner "ansible" {
    playbook_file = "./add_users_playbook.yml"
  }

}