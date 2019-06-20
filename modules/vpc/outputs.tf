output "eip_public_ip" {
  value = aws_eip.ip.public_ip
}

output "eip_public_dns" {
  value = aws_eip.ip.public_dns
}

output "vpc_id" {
  value = aws_vpc.nextcloud_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.nextcloud_app_subnet.id
}

output "private_subnet_id" {
  value = aws_subnet.nextcloud_db_subnet.id
}

output "subnet_group" {
  value = aws_db_subnet_group.nextcloud_db_subnet_grp.id
}