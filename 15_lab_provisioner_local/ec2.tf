# Conditional expression  "condition ? true_value : false_value" eg count = var.istest == true ? 2 : 0
locals {
  # Common tags to be assigned to all resources
  common_tags = {
    Service = "Terraform"
    Owner   = "Julie"
  }
}

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
  instance_type = "t2.micro"
  
  provisioner "local-exec" {
    command = "echo ${aws_instance.amzn2_linux_instance.private_ip} >> private_ips.txt"
  }
  
}
