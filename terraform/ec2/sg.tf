resource "aws_security_group" "sg" {
  name = "packer-example-sg"
  vpc_id = var.vpc_id
  ingress {
    cidr_blocks = var.allow_ssh_from_cidrs
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.tag_name
  }
}