output "id" {
  value       = module.optimized-mysql-server.mysql_id
  description = "Instance ID for the MySQL instance that has been created"
}

output "address" {
  value       = module.optimized-mysql-server.mysql_address
  description = "Hostname of the MySQL instance that has been created"
  sensitive   = true
}

output "port" {
  value       = module.optimized-mysql-server.mysql_port
  description = "Port that the MySQL instance is listening on"
}

output "username" {
  value       = module.optimized-mysql-server.mysql_username
  description = "Master username for the MySQL instance that has been created"
  sensitive   = true
}

output "endpoint" {
  value       = module.optimized-mysql-server.mysql_endpoint
  description = "Connection endpoing for the MySQL instance that has been created"
  sensitive   = true
}
