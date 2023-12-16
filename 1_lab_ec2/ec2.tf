data "aws_ami" "amazon-linux-2" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "amzn_linux_2_instance" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"
}
