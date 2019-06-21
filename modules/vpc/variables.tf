variable "instance_id" {
    description = "Instance id to assign the Elastic IP to"
}
variable "vpc_cidr" {
  description = "CIDR of the VPC"
}

variable "public_subnet_cidr" {
  description = "CIDR of the public subnet"
}

variable "private_subnet_cidr" {
  description = "CIDR of the private subnet"
}