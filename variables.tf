# we recommend memory optimized instances - db.m6i.large, db.m6i.xlarge, db.m6i.2xlarge, db.m6i.4xlarge, db.m6i.8xlarge, db.m6i.12xlarge, db.m6i.16xlarge, db.m6i.24xlarge, db.m6i.32xlarge
# see more: https://aws.amazon.com/rds/mysql/pricing/?nc=sn&loc=4
# The 6th generation of Amazon EC2 x86-based General Purpose compute instances are designed to provide a balance of compute, memory, storage, and network resources.

variable "vpc_id" {
  description = "id of the vpc"
  type        = string
}

variable "db_password" {
  description = "RDS root user password"
  sensitive   = true
}

variable "aws_database_instance_class" {
  type        = string
  description = "The instance type of the RDS instance."
  validation {
    condition     = contains(["db.m6i.large", "db.m6i.xlarge", "db.m6i.2xlarge", "db.m6i.4xlarge", "db.m6i.8xlarge", "db.m6i.12xlarge", "db.m6i.16xlarge", "db.m6i.24xlarge", "db.m6i.32xlarge"], var.aws_database_instance_class)
    error_message = "The aws_database_instance_class must be one of the following: \"db.m6i.large\",\"db.m6i.xlarge\", \"db.m6i.2xlarge\", \"db.m6i.4xlarge\", \"db.m6i.8xlarge\", \"db.m6i.12xlarge\",\"db.m6i.16xlarge\",\"db.m6i.24xlarge\", \"db.m6i.32xlarge\" \"."
  }
  default = "db.m6i.2xlarge"
}

variable "region" {
  description = "AWS region"
  type        = string

  ## Set the value of the aws region where the database will be created
  default = "us-east-1"
}

variable "db_subnet_group_name" {
  description = "db subnet group name"
  type        = string
  default     = "mysql"
}

variable "db_subnet_group_tag" {
  description = "tag for db subnet group"
  type        = map(string)
  default = {
    "Name" = "mysql"
  }
}

variable "aws_security_group_name" {
  description = "security group name for the rds"
  type        = string
  default     = "mysql_rds"
}

variable "ingress_from_port" {
  description = "ingress from port for rds security group"
  type        = number
  default     = 3306
}

variable "ingress_to_port" {
  description = "ingress from port for rds security group"
  type        = number
  default     = 3306
}

variable "ingress_protocol" {
  description = "ingress protocol for rds security group"
  type        = string
  default     = "tcp"
}

variable "ingress_cidr_blocks" {
  description = "ingress cidr block for rds security group"
  type        = list(string)

  ## Cidr block for allowed incoming connection to the database. Change it as needed before connecting to the database
  default = ["0.0.0.0/0"]
}
variable "egress_from_port" {
  description = "egress from port for rds security group"
  type        = number
  default     = 3306
}

variable "egress_to_port" {
  description = "egress from port for rds security group"
  type        = number
  default     = 3306
}

variable "egress_protocol" {
  description = "egress protocol for rds security group"
  type        = string
  default     = "tcp"
}

variable "egress_cidr_blocks" {
  description = "egress cidr block for rds security group"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "rds_security_group_tag" {
  description = "tag for rds security group"
  type        = map(string)
  default = {
    "Name" = "mysql_rds"
  }
}

variable "db_parameter_group_name" {
  description = "name for db parameter group"
  type        = string
  default     = "mysql"
}

variable "db_parameter_group_family" {
  description = "family for db parameter group"
  type        = string
  default     = "mysql8.0"
}

variable "aws_database_instance_identifier" {
  type    = string
  default = "mysql"
}

variable "aws_database_allocated_storage" {
  type        = string
  description = "The allocated storage in gibibytes."
  default     = 20
}

variable "aws_database_engine_version" {
  description = "database engine version for aws database instance"
  type        = string
  default     = "8.0"
}

variable "aws_db_username" {
  description = "Username for the master DB user"
  type        = string
  default     = "mysqladmin"
}

variable "aws_database_publicly_accessible" {
  description = "flag to indicate whether database will be publicly accessible"
  type        = bool
  default     = false
}

variable "aws_database_skip_final_snapshot" {
  description = "The name which is prefixed to the final snapshot on cluster destroy"
  type        = bool
  default     = false
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