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

resource "aws_instance" "centos_instance" {
  ami             = data.aws_ami.amazon-linux-2.id
  instance_type   = "t2.micro"
#   key_name        = "your-key-pair-name"  # Replace with your key pair name
#   security_groups = ["your-security-group-name"]  # Replace with your security group name

  # Other instance configurations like subnet_id, tags, etc., can be added here
}
