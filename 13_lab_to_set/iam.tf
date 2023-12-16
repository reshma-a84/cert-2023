resource "aws_iam_user" "tf_user" {
    for_each = toset( ["user-02", "user-01", "user-03"]) 
    # toset will order the parameters and then create new iam users
    name = each.key
}
