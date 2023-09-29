
module "optimized-mysql-server" {
  source         = "intel/aws-mysql/intel"
  db_password    = var.db_password
  rds_identifier = "mysql-terraform"
  vpc_id = "vpc-0bf95158fd23f4e2e"
  db_tags = {
    "App" = "Intel Optimized Database"
    "Owner" = "Lucas.Melo@intel.com"
    "Duration" = "8"
  }
}