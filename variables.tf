#############
# Instances #
#############

variable "aws_region" {
  description = "Region where to deploy the Nextcloud application and the database"
  default = "eu-west-1"
}
variable "nextcloud_instance_type" {
    description = "Instance type for the Nextcloud application"
    default = "t2.micro"
}

variable "nextcloud_key_name" {
    description = "SSH key name to associate to the Nextcloud app instance"
    default = null
}

variable "db_instance_type" {
  description = "Database instance type"
  default = "db.t2.micro"
}


###########
# Network #
###########

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default = "10.0.0.0/16"
}

variable "nextcloud_cidr" {
  description = "CIDR for the public subnet"
  default = "10.0.1.0/24"
}

variable "db_cidr" {
  description = "CIDR for the private subnet"
  default = "10.0.2.0/24"
}


############
# Database #
############
variable "db_user" {
  description = "Nextcloud database root user"
}

variable "db_pass" {
  description = "Nextcloud database root password"
}


#############
# Nextcloud #
#############

variable "admin_user" {
  description = "Nextcloud admin user"
}

variable "admin_pass" {
  description = "Nextcloud admin password"
}

################
# S3 datastore #
################

variable "s3_bucket_name" {
  description = "Name of the S3 bucket to use as datastore"
  default = "nextcloud-datastore"
}

variable "force_datastore_destroy" {
  description = "Destroy all objects so that the bucket can be destroyed without error. These objects are not recoverable"
  default = false
}
