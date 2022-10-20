# we recommend memory optimized instances - db.m61.large, db.m6i.xlarge, db.m6i.2xlarge, db.m6i.4xlarge, db.m6i.8xlarge, db.m6i.12xlarge, db.m6i.16xlarge, db.m6i.24xlarge, db.m6i.32xlarge
# see more: https://aws.amazon.com/rds/mysql/pricing/?nc=sn&loc=4
#add what is 6i

variable "instance_class" {
  type        = string
  description = "The instance type of the RDS instance."
  default     = "db.m6i.8xlarge"
}
#MySQL Server Name 
variable "mysql_server_name" {
  description = "MySQL server name"
  type        = string
}
variable "allocated_storage" {
  type        = string
  description = "The allocated storage in gibibytes."
  default     = 400
}
variable "engine" {
  type    = string
  default = "mysql"
}
variable "availability_zone" {
  description = "The Availability Zone of the RDS instance"
  type        = string
  default     = null
}
variable "iops" {
  description = "The amount of provisioned IOPS. Setting this implies a storage_type of 'io1'"
  type        = number
  default     = 3000
}

variable "username" {
  description = "Username for the master DB user"
  type        = string
  default     = mysqladmin
}

variable "password" {
  description = <<EOF
  Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file.
  The password provided will not be used if the variable create_random_password is set to true.
  EOF
  type        = string
  sensitive   = true
}

variable "final_snapshot_identifier_prefix" {
  description = "The name which is prefixed to the final snapshot on cluster destroy"
  type        = string
  default     = "final"
}
variable "max_connections" {
  description = "Max connections"
  type        = number
  default     = 4000
}
variable "family" {
  type    = string
  default = "mysql8.0"
}
variable "parameters" {
  description = "A list of DB parameter maps to apply"
  type        = list(map(string))
  default = [
    {
      name  = "table_open_cache"
      value = 8000
    },
    {
      name         = "table_open_cache_instances"
      value        = 16
      apply_method = "pending-reboot"
    },
    {
      name  = "max_connections"
      value = 4000
    },
    {
      name         = "back_log"
      value        = 1500
      apply_method = "pending-reboot"
    },
    {
      name  = "default_password_lifetime"
      value = 0
    },
    {
      name         = "performance_schema"
      value        = "OFF"
      apply_method = "pending-reboot"
    },
    {
      name  = "max_prepared_stmt_count"
      value = 128000
    },
    {
      name  = "character_set_server"
      value = "latin1"
    },
    {
      name  = "collation_server"
      value = "latin1_swedish_ci"
    },
    {
      name  = "transaction_isolation"
      value = "REPEATABLE-READ"
    },
    {
      name         = "innodb_log_file_size"
      value        = 1024 * 1024 * 1024
      apply_method = "pending-reboot"
    },
    {
      name         = "innodb_open_files"
      value        = 4000
      apply_method = "pending-reboot"
    },
    {
      name         = "innodb_buffer_pool_instances"
      value        = 16
      apply_method = "pending-reboot"
    },
    {
      name         = "innodb_log_buffer_size"
      value        = 67108864
      apply_method = "pending-reboot"
    },
    {
      name  = "innodb_thread_concurrency"
      value = 0
    },
    {
      name  = "innodb_flush_log_at_trx_commit"
      value = 0
    },
    {
      name  = "innodb_max_dirty_pages_pct"
      value = 90
    },
    {
      name  = "innodb_max_dirty_pages_pct_lwm"
      value = 10
    },
    {
      name  = "join_buffer_size"
      value = 32 * 1024
    },
    {
      name  = "sort_buffer_size"
      value = 32 * 1024
    },
    {
      name         = "innodb_use_native_aio"
      value        = 1
      apply_method = "pending-reboot"
    },
    {
      name  = "innodb_stats_persistent"
      value = 1
    },
    {
      name  = "innodb_spin_wait_delay"
      value = 6
    },
    {
      name  = "innodb_max_purge_lag_delay"
      value = 300000
    },
    {
      name  = "innodb_max_purge_lag"
      value = 0
    },
    {
      name  = "innodb_checksum_algorithm"
      value = "none"
    },
    {
      name  = "innodb_io_capacity"
      value = 4000
    },
    {
      name  = "innodb_io_capacity_max"
      value = 20000
    },
    {
      name  = "innodb_lru_scan_depth"
      value = 9000
    },
    {
      name  = "innodb_change_buffering"
      value = "none"
    },
    {
      name         = "innodb_page_cleaners"
      value        = 4
      apply_method = "pending-reboot"
    },
    {
      name  = "innodb_undo_log_truncate"
      value = "off"
    },
    {
      name  = "innodb_adaptive_flushing"
      value = 1
    },
    {
      name  = "innodb_flush_neighbors"
      value = 0
    },
    {
      name         = "innodb_read_io_threads"
      value        = 16
      apply_method = "pending-reboot"
    },
    {
      name         = "innodb_write_io_threads"
      value        = 16
      apply_method = "pending-reboot"
    },
    {
      name         = "innodb_purge_threads"
      value        = 4
      apply_method = "pending-reboot"
    },
    {
      name  = "innodb_adaptive_hash_index"
      value = 0
    }

  ]
}