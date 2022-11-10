output "id" {
  value       = module.optimized-mysql-server.id
  description = "Instance ID for the MySQL instance that has been created"
}

output "address" {
  value       = module.optimized-mysql-server.address
  description = "Hostname of the MySQL instance that has been created"
}

output "port" {
  value       = module.optimized-mysql-server.port
  description = "Port that the MySQL instance is listening on"
}

output "username" {
  value       = module.optimized-mysql-server.username
  description = "Master username for the MySQL instance that has been created"
}

output "endpoint" {
  value       = module.optimized-mysql-server.endpoint
  description = "Connection endpoing for the MySQL instance that has been created"
}
