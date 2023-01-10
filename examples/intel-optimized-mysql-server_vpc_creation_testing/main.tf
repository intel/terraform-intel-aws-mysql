# Example of how to pass variable for database password:
# terraform apply -var="db_password=..."
# Environment variables can also be used https://www.terraform.io/language/values/variables#environment-variables

# Provision Intel Optimized AWS MySQL server
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = "my-vpc"
  cidr   = "10.0.0.0/16"



  azs             = ["us-east-2a", "us-east-2b", "us-east-2c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]


  tags = {
    Owner    = "Intel.Cloud.Optimization.Modules@inte.com"
    Duration = "4"
  }
}

module "optimized-mysql-server" {
  source         = "intel/aws-mysql/intel"
  rds_identifier = "mysql-dev"
  db_password    = var.db_password
  # Update the vpc_id below for the VPC that this module will use. Find the vpc-id in your AWS account
  # from the AWS console or using CLI commands. In your AWS account, the vpc-id is represented as "vpc-",
  # followed by a set of alphanumeric characters. One sample representation of a vpc-id is vpc-0a6734z932p20c2m4
  #vpc_id = module.vpc.vpc_id
  multi_az = false 
  vpc_id               = module.vpc.vpc_id
  create_subnet_group = true
  db_subnet_group_name = "subnet-group-test-09"
  db_tags = {
    Owner    = "Intel.Cloud.Optimization.Modules@inte.com"
    Duration = "4"
  }
  ingress_cidr_blocks = ["10.10.1.0/24"]
}
