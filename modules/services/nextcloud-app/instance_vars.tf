variable "instance_type" {
    default = "t2.micro"
}

variable "aws_region"{
    default = "eu-west-1"
}

variable "subnet_id" {
    description = "Subnet to place this instance"
}

variable "vpc_id" {
    description = "Vpc id"
}

variable "key_name" {
    description = "SSH Key name to associate to this instance"
}