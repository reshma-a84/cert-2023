resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "mysg" {
  name   = "my-security-group"
  vpc_id = aws_default_vpc.default.id
}

resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  security_group_id = aws_security_group.mysg.id
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks = aws_default_vpc.default.cidr_blocks
}

# resource "aws_security_group_rule" "nginx" {
#   type              = "ingress"
#   security_group_id = aws_security_group.mysg.id
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"

# }

output "vpc_details" {
    value = aws_default_vpc.default.cidr_block
  
}