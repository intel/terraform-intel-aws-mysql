# Example of how to pass variable for database password:
# terraform apply -var="db_password=..."
# Environment variables can also be used https://www.terraform.io/language/values/variables#environment-variables

# Provision Intel Optimized AWS MySQL server
module "optimized-mysql-server" {
  source                     = "../../"
  create_security_group      = true
  rds_identifier             = "mysql"
  db_password                = "SuperPassword!"
  db_allocated_storage       = 20
  db_max_allocated_storage   = 100
  db_name                    = "devdb"
  db_backup_retention_period = 3
  db_engine                  = "mysql"
  db_encryption              = true
  instance_class             = "db.m6i.large"
  db_cloudwatch_logs_export  = ["audit", "error", "general", "slowquery"]
  db_tags = {
    "database" = "dev"
  }
  # Update the vpc_id below for the VPC that this module will use. Find the vpc-id in your AWS account
  # from the AWS console or using CLI commands. In your AWS account, the vpc-id is represented as "vpc-",
  # followed by a set of alphanumeric characters. One sample representation of a vpc-id is vpc-0a6734z932p20c2m4
  vpc_id = "vpc-0ae643f51f9761b2f"
}