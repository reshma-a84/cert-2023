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

# ****************************************************************
#        Data source to bring output of iam instance profile
# ****************************************************************

data "terraform_remote_state" "iam_profile" {
  backend = "s3"

  config = {
    bucket = "cert-ayzb-ho-tfstate-bucket"
    key = "remote-state/iam-profile.tfstate"
    region = "us-east-1"
  }
}


resource "aws_instance" "amzn_linux_2_instance" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"
  iam_instance_profile = "${data.terraform_remote_state.iam_profile.outputs.iam_profile}"

}
