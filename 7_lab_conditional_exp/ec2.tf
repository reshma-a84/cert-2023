# Conditional expression  "condition ? true_value : false_value" eg count = var.istest == true ? 2 : 0



data "aws_ami" "amazon-linux-2" {
  most_recent = true
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64*"]
  }
}

resource "aws_instance" "amzn2_linux_instance" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = var.instancelist[2]
  count         = var.istest == true ? 2 : 0
  tags = {
    Name = "instance ${count.index}" //Names each instance with the count.index number taken from count_name list
  }
}

output "ami_id" {
  value = data.aws_ami.amazon-linux-2.id
}