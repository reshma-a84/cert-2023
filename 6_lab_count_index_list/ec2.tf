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
  instance_type = var.instancemap["us-east-1"]
  count = 3 //Creates 3 instances. ie the resource will run as a loop. If count = 4 is given, terraform plan will give an error as Invalid index as the value of the index is only 3
  tags = {
    Name = var.count_name[count.index] //Names each instance with the count.index number taken from count_name list
  }
}

output "ami_id" {
  value = data.aws_ami.amazon-linux-2.id
}