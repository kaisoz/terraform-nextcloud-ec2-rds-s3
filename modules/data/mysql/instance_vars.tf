variable "instance_type" {
  description = "Database instance type"
  default = "db.t2.micro"
}

variable "vpc_id" {
  description = "VPC id to assign to the db"
}

variable "subnet_id" {
  description = "Subnet to place this instance"
}

variable "public_subnet_cidr" {
  description = "CIDR of the public subnet"
}

variable "subnet_group" {
  description = "Subnet group to assign to the db"
}