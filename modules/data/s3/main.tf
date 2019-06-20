resource "aws_s3_bucket" "nextcloud_s3_datastore" {
  bucket = var.s3_bucket_name
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
      }
    }
  }

  force_destroy = var.force_destroy

  tags = {
    Name = "Nextcloud_datastore"
  }
}

# Allow access to the bucket only to the nextcloud user and the terraform user
resource "aws_s3_bucket_policy" "nextcloud_s3_datastore_policy" {

  bucket = aws_s3_bucket.nextcloud_s3_datastore.id

  policy = <<S3_POLICY
{
  "Id": "NextcloudS3Policy",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllActions",
      "Effect": "Allow",
      "Action": "s3:*",
      "Resource": [ 
          "${aws_s3_bucket.nextcloud_s3_datastore.arn}",
          "${aws_s3_bucket.nextcloud_s3_datastore.arn}/*" 
        ],
      "Principal": {
        "AWS": [
            "${var.nextcloud_iam_user_arn}",
            "${var.terraform_iam_user_arn}"
        ]
      }
    },
    {
      "Sid": "DenyTheRest",
      "Effect": "Deny",
      "Action": ["s3:*"],
      "Resource": [ "${aws_s3_bucket.nextcloud_s3_datastore.arn}" ],
      "NotPrincipal": {
        "AWS": [
            "${var.nextcloud_iam_user_arn}",
            "${var.terraform_iam_user_arn}"
        ]
      }
    }
  ]
}
S3_POLICY
}