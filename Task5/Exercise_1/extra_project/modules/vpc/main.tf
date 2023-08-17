resource "aws_vpc" "udacity_vpc" {
  cidr_block = var.vpc_cidr_block

}

resource "aws_subnet" "udacity_vpc_public" {
  vpc_id     = aws_vpc.udacity_vpc.id
  cidr_block = var.vpc_public_subnet_cidr_block
}

resource "aws_subnet" "udacity_vpc_private" {
  vpc_id     = aws_vpc.udacity_vpc.id
  cidr_block = var.vpc_private_subnet_cidr_block
}

resource "aws_security_group" "app_server_security_group" {
  name = "app_server_security_group"
}

resource "aws_security_group_rule" "ssh_in" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.app_server_security_group.id
}

resource "aws_security_group_rule" "http_in" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.app_server_security_group.id
}

resource "aws_security_group_rule" "all_out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.app_server_security_group.id
}
