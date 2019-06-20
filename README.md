# terraform-nextcloud-ec2-rds-s3
 
 Terraform configuration to install the Nextcloud application in AWS along with all its dependencies.
  
## Features

### Network

* Custom Virtual Private Cloud (VPC)
* Public and private subnets
* Internet gateway and custom route table

### Nextcloud application

* AWS EC2 instance (t2.micro by default)
* AWS AMI (Ubuntu 18.04 LTS)
* Internet facing (Public subnet)
* Elastic IP associated
* Security group to allow access the Nextcloud UI
* IAM user which only have permissions to connect to the S3 datastore

### Nextcloud database

* RDS for MySql instance (db.t2.micro by default)
* Private subnet
* Security group to allow only access from the Nextcloud app EC2 instance

### Nextcloud datastore

* Data stored in a S3 bucket
* Encryption enabled
* Bucket policy to allow access only to the Nextcloud application IAM user

