data "aws_ami" "ami" {
  most_recent = true
  executable_users = [ var.ami_owner ]
  owners = [ var.ami_owner ]
  
  filter {
    name = "name"
    values = [ var.ami_name_filter ]
  }

  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }

  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
}