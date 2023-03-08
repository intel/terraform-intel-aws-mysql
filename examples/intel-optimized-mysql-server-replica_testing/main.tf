# Environment variables can also be used https://www.terraform.io/language/values/variables#environment-variables

# Provision Intel Optimized AWS MySQL server in default vpc of the selected AWS region and create a read replica in a different 
# availability zone than the primary database server

module "optimized-mysql-server" {
  source         = "intel/aws-mysql/intel"
  rds_identifier = "mysqldev"
  db_password    = var.db_password

  # Update the vpc_id below for the VPC that this module will use. Find the default vpc-id in your AWS account
  # from the AWS console or using CLI commands. In your AWS account, the vpc-id is represented as "vpc-",
  # followed by a set of alphanumeric characters. One sample representation of a vpc-id is vpc-0a6734z932p20c2m4
  vpc_id = "vpc-0abf36f0171c55ae1"
}

module "optimized-mysql-server-read-replica" {
  source         = "intel/aws-mysql/intel"
  rds_identifier = "mysqldevreplica"
  db_password    = var.db_password

  # Update the vpc-id below. Use the same vpc-id as the one used in the prior module.
  vpc_id                           = "vpc-0abf36f0171c55ae1"
  db_replicate_source_db           = module.optimized-mysql-server.db_instance_id
  kms_key_id                       = module.optimized-mysql-server.db_kms_key_id
}