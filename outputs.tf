output "mysql_id" {
  value       = aws_db_instance.mysql_server.id
  description = "Instance ID for the MySQL instance that has been created"
}

output "mysql_address" {
  value       = aws_db_instance.mysql_server.address
  description = "Hostname of the MySQL instance that has been created"
}

output "mysql_port" {
  value       = aws_db_instance.mysql_server.port
  description = "Port that the MySQL instance is listening on"
}

output "mysql_username" {
  value       = aws_db_instance.mysql_server.username
  description = "Master username for the MySQL instance that has been created"
}

output "mysql_endpoint" {
  value       = aws_db_instance.mysql_server.endpoint
  description = "Connection endpoint for the MySQL instance that has been created"
}
