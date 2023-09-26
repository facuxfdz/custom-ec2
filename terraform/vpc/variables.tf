variable "vpc_cidr" {
  default = "10.0.1.0/24"
  type = string
}

variable "public_subnet_cidr" {
  default = "10.0.1.128/25"
  type = string
}