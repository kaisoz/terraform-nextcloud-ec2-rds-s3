data "aws_caller_identity" "terraform_user" {}

# By default, a new IAM user has no permissions, so it can do nothing
resource "aws_iam_user" "nextcloud-s3" {
  name = "terraform-nextcloud-s3"
}

resource "aws_iam_access_key" "nextcloud-s3-access_key" {
  user = aws_iam_user.nextcloud-s3.name
}
