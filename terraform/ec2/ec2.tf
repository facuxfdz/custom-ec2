resource "aws_instance" "instance" {
  ami = data.aws_ami.ami.id
  instance_type = var.instance_type
  security_groups = [ aws_security_group.sg.id ]
  subnet_id = var.subnet_id
  associate_public_ip_address = true
  tags = {
    "Name" = var.tag_name
  }
}