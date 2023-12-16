resource "aws_iam_instance_profile" "ec2_iam_profile" {
  name = "ec2_iam_profile"
  role = aws_iam_role.role.name
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "role" {
  name               = "hands-on-role"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}



# Note: Only when the iam_profile is sent to output, only then the value would be present in the tfstate file
output "iam_profile" {
  value = aws_iam_instance_profile.ec2_iam_profile.name
}