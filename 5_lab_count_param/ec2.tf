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
  # instance_type = var.instancelist[2]
  instance_type = var.instancemap["ap-south-1"]
  count = 3 //Creates 3 instances. ie the resource will run as a loop
  tags = {
    Name = "instance${count.index}" //Names each instance with the count.index number eg "instance0,instance1,instance2 etc"
  }
}

output "ami_id" {
  value = data.aws_ami.amazon-linux-2.id
}