variable "s3_bucket_name" {
    description = "Name of the S3 bucket to store the data"
}

variable "s3_access_key" {
    description = "Access key of the IAM user with rights to access the S3 datastore"
}

variable "s3_secret_key" {
    description = "Secret key of the IAM user with rights to access the S3 datastore"
}
