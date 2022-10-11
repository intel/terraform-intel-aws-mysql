#MySQL Server Name 
variable "mysql_server_name" {
  description = "MySQL server name"
  type        = string
}
variable "allocated_storage" {
  type        = string
  description = "The allocated storage in gibibytes."
  default = 400
}
variable "engine" {
  type = string
  default = "mysql"
}
variable "engine_version" {
  type = string
  default = "5.8"
}
# we recommend memory optimized instances - db.m61.large, db.m6i.xlarge, db.m6i.2xlarge, db.m6i.4xlarge, db.m6i.8xlarge, db.m6i.12xlarge, db.m6i.16xlarge, db.m6i.24xlarge, db.m6i.32xlarge
# see more: https://aws.amazon.com/rds/mysql/pricing/?nc=sn&loc=4

variable "instance_class" {
  type        = string
  description = "The instance type of the RDS instance."
  default = "db.m6i.8xlarge"
}
variable "availability_zone" {
  description = "The Availability Zone of the RDS instance"
  type        = string
  default     = "us-west-1"
}
variable "iops" {
  description = "The amount of provisioned IOPS. Setting this implies a storage_type of 'io1'"
  type        = number
  default     = 3000
}

variable "username" {
  description = "Username for the master DB user"
  type        = string
  default     = null
}

variable "password" {
  description = <<EOF
  Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file.
  The password provided will not be used if the variable create_random_password is set to true.
  EOF
  type        = string
  default     = null
  sensitive   = true
}

