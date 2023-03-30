locals {
  subnet_ids = data.aws_subnets.def_vpc_subnets.ids
}

## Create instance - will use defaults for parameters not specified (e.g. VPC, security group)
resource "aws_instance" "server1" {
  count = 0
  ami           = var.my_ami
  instance_type = var.instance_type

  subnet_id = local.subnet_ids[count.index]
  vpc_security_group_ids = [aws_security_group.sec_web.id]
 
  tags = {
    Name    = "vm-${local.name_suffix}-1"
  }
}