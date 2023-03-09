output "mysql_address" {
  description = "MySQL instance hostname"
  value       = module.optimized-mysql-server.db_hostname
}

output "mysql_port" {
  description = "MySQL instance port"
  value       = module.optimized-mysql-server.db_port
}

output "mysql_username" {
  description = "MySQL instance root username"
  value       = module.optimized-mysql-server.db_username
  sensitive   = true
}

output "mysql_password" {
  description = "MySQL instance master password."
  value       = module.optimized-mysql-server.db_password
  sensitive   = true
}

output "mysql_endpoint" {
  value       = module.optimized-mysql-server.db_endpoint
  description = "Connection endpoint for the MySQL instance that has been created"
}

output "mysql_engine" {
  value       = module.optimized-mysql-server.db_engine
  description = "Database instance engine that was configured."
}

output "mysql_status" {
  description = "Status of the database instance that was created."
  value       = module.optimized-mysql-server.db_status
}

output "instance_class" {
  description = "Instance class in use for the database instance that was created."
  value       = module.optimized-mysql-server.instance_class
}

output "mysql_allocated_storage" {
  description = "Storage that was allocated to the instance when it configured."
  value       = module.optimized-mysql-server.db_allocated_storage
}

output "mysql_max_allocated_storage" {
  description = "Maximum storage allocation that is configured on the database instance."
  value       = module.optimized-mysql-server.db_max_allocated_storage
}

output "mysql_arn" {
  description = "ARN of the database instance."
  value       = module.optimized-mysql-server.db_arn
}

output "mysql_kms_key_id" {
  description = "KMS key that is configured on the database instance if storage encryption is enabled."
  value       = module.optimized-mysql-server.db_kms_key_id
}

output "mysql_backup_window" {
  description = "Configured backup window for the database instance."
  value       = module.optimized-mysql-server.db_backup_window
}

output "mysql_maintenance_window" {
  description = "Maintainence window for the database instance."
  value       = module.optimized-mysql-server.db_maintenance_window
}

output "mysql_db_name" {
  description = "Name of the database that was created (if specified) during instance creation."
  value       = module.optimized-mysql-server.db_name
}


###########################################################################################
# Replica
###########################################################################################

output "replica_mysql_address" {
  description = "MySQL instance hostname"
  value       = module.optimized-mysql-server-read-replica.db_hostname
}

output "replica_mysql_port" {
  description = "MySQL instance port"
  value       = module.optimized-mysql-server-read-replica.db_port
}

output "replica_mysql_username" {
  description = "MySQL instance root username"
  value       = module.optimized-mysql-server-read-replica.db_username
  sensitive   = true
}

output "replica_mysql_password" {
  description = "MySQL instance master password."
  value       = module.optimized-mysql-server-read-replica.db_password
  sensitive   = true
}

output "replica_mysql_endpoint" {
  value       = module.optimized-mysql-server-read-replica.db_endpoint
  description = "Connection endpoint for the MySQL instance that has been created"
}

output "replica_mysql_engine" {
  value       = module.optimized-mysql-server-read-replica.db_engine
  description = "Database instance engine that was configured."
}

output "replica_mysql_status" {
  description = "Status of the database instance that was created."
  value       = module.optimized-mysql-server-read-replica.db_status
}

output "replica_instance_class" {
  description = "Instance class in use for the database instance that was created."
  value       = module.optimized-mysql-server-read-replica.instance_class
}

output "replica_mysql_allocated_storage" {
  description = "Storage that was allocated to the instance when it configured."
  value       = module.optimized-mysql-server-read-replica.db_allocated_storage
}

output "replica_mysql_max_allocated_storage" {
  description = "Maximum storage allocation that is configured on the database instance."
  value       = module.optimized-mysql-server-read-replica.db_max_allocated_storage
}

output "replica_mysql_arn" {
  description = "ARN of the database instance."
  value       = module.optimized-mysql-server-read-replica.db_arn
}

output "replica_mysql_kms_key_id" {
  description = "KMS key that is configured on the database instance if storage encryption is enabled."
  value       = module.optimized-mysql-server-read-replica.db_kms_key_id
}

output "replica_mysql_backup_window" {
  description = "Configured backup window for the database instance."
  value       = module.optimized-mysql-server-read-replica.db_backup_window
}

output "replica_mysql_maintenance_window" {
  description = "Maintainence window for the database instance."
  value       = module.optimized-mysql-server-read-replica.db_maintenance_window
}

output "replica_mysql_db_name" {
  description = "Name of the database that was created (if specified) during instance creation."
  value       = module.optimized-mysql-server-read-replica.db_name
}