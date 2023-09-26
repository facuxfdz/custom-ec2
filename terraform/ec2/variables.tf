variable "ami_name_filter" {
  description = "AMI name filter"
  default     = "packer-ami-*"
}

variable "ami_owner" {
  description = "AMI owner"
  default     = "self"
}

variable "instance_type" {
  description = "Instance type"
  default     = "t2.micro"
}

variable "allow_ssh_from_cidrs" {
  description = "CIDR blocks to allow SSH access from"
  default     = ["0.0.0.0/0"]
}

variable "tag_name" {
  description = "Name tag"
  default     = "packer-ami"
}

variable "subnet_id" {
  description = "Subnet ID"
  default     = ""
}

variable "vpc_id" {
  description = "VPC ID"
    default     = ""
}