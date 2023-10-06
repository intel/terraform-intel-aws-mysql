# Initialize Densify Module that will parse the densify_recommendations.auto.tfvars recommendation file
module "densify" {
  source  = "densify-dev/optimization-as-code/null"
  densify_recommendations = var.densify_recommendations
  densify_fallback        = var.densify_fallback
  densify_unique_id       = var.name
}


module "optimized-mysql-server" {
  source         = "intel/aws-mysql/intel"
  db_password    = var.db_password
  rds_identifier = var.name
  #instance_class = "db.m5.2xlarge"
  instance_class = module.densify.recommended_type
  vpc_id = "<YOUR-VPC-ID-HERE>"
  db_tags = {
    "App" = "Intel Optimized Database"
    "Owner" = "Intel.Cloud.Optimization.Modules@intel.com"
    "Duration" = "8"
  }
}