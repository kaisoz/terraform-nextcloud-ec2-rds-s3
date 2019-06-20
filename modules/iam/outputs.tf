output "nextcloud_iam_user_arn" {
    value= aws_iam_user.nextcloud-s3.arn
}

output "nextcloud_iam_user_access_key" {
  value = aws_iam_access_key.nextcloud-s3-access_key.id
}

output "nextcloud_iam_user_secret_key" {
  value = aws_iam_access_key.nextcloud-s3-access_key.secret
}

output "terraform_iam_user_arn" {
    value = data.aws_caller_identity.terraform_user.arn
}

