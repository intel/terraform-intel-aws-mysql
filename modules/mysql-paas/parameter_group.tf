resource "aws_db_parameter_group" "tf-mysql-parameter-group" {
  name   = "tf-mysql-parameter-group"
  family = "mysql8.0"

  #General

  parameter {
    name  = "max_connections"
    value = var.max_connections
  }
  parameter {
    name  = "table_open_cache"
    value = 8000
  }
  parameter {
    name  = "table_open_cache_instances"
    value = 16
    apply_method = "pending-reboot"
  }
  parameter {
    name  = "back_log"
    value = 1500
    apply_method = "pending-reboot"
  }
  parameter {
    name  = "default_password_lifetime"
    value = 0
  }
  parameter {
    name  = "performance_schema"
    value = "OFF"
    apply_method = "pending-reboot"
  }
  parameter {
    name  = "max_prepared_stmt_count"
    value = 128000
  }
  parameter {
    name  = "character_set_server"
    value = "latin1"
  }
  parameter {
    name  = "collation_server"
    value = "latin1_swedish_ci"
  }
  parameter {
    name  = "transaction_isolation"
    value = "REPEATABLE-READ"
  }

  #Files

  parameter {
    name  = "innodb_log_file_size"
    value = 1024*1024*1024
    apply_method = "pending-reboot"
  }
  parameter {
    name  = "innodb_open_files"
    value = 4000
    apply_method = "pending-reboot"
  }

  #Buffers

  parameter {
    name  = "innodb_buffer_pool_size"
    value = "{DBInstanceClassMemory*3/4}" 
  }
  parameter {
    name  = "innodb_buffer_pool_instances"
    value = 16
    apply_method = "pending-reboot"
  }
  parameter {
    name  = "innodb_log_buffer_size"
    value = 67108864
    apply_method = "pending-reboot"
  }

  #Tune

  parameter {
    name  = "innodb_thread_concurrency"
    value = 0
  }
  parameter {
    name  = "innodb_flush_log_at_trx_commit"
    value = 0
  }
  parameter {
    name  = "innodb_max_dirty_pages_pct"
    value = 90
  }
  parameter {
    name  = "innodb_max_dirty_pages_pct_lwm"
    value = 10
  }
  parameter {
    name  = "join_buffer_size"
    value = 32*1024
  }
  parameter {
    name  = "sort_buffer_size"
    value = 32*1024
  }
  parameter {
    name  = "innodb_use_native_aio"
    value = 1
    apply_method = "pending-reboot"
  }
  parameter {
    name  = "innodb_stats_persistent"
    value = 1
  }
  parameter {
    name  = "innodb_spin_wait_delay"
    value = 6
  }
  parameter {
    name  = "innodb_max_purge_lag_delay"
    value = 300000
  }
  parameter {
    name  = "innodb_max_purge_lag"
    value = 0
  }
  parameter {
    name  = "innodb_checksum_algorithm"
    value = "none"
  }
  parameter {
    name  = "innodb_io_capacity"
    value = 4000
  }
  parameter {
    name  = "innodb_io_capacity_max"
    value = 20000
  }
  parameter {
    name  = "innodb_lru_scan_depth"
    value = 9000
  }
  parameter {
    name  = "innodb_change_buffering"
    value = "none"
  }
  parameter {
    name  = "innodb_page_cleaners"
    value = 4
    apply_method = "pending-reboot"
  }
  parameter {
    name  = "innodb_undo_log_truncate"
    value = "off"
  }

  #Perf Special

  parameter {
    name  = "innodb_adaptive_flushing"
    value = 1
  }
  parameter {
    name  = "innodb_flush_neighbors"
    value = 0
  }
  parameter {
    name  = "innodb_read_io_threads"
    value = 16
    apply_method = "pending-reboot"
  }
  parameter {
    name  = "innodb_write_io_threads"
    value = 16
    apply_method = "pending-reboot"
  }
  parameter {
    name  = "innodb_purge_threads"
    value = 4
    apply_method = "pending-reboot"
  }
  parameter {
    name  = "innodb_adaptive_hash_index"
    value = 0
  }

}



