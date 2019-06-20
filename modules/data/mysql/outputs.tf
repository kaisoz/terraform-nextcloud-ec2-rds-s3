output "db_endpoint" {
  value = aws_db_instance.nextcloud_mysql_instance.endpoint
}

output "db_name" {
  value = aws_db_instance.nextcloud_mysql_instance.name
}