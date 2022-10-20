module "optimized-mysql-server" {
  source            = "github.com/lucasmelogithub/terraform-intel-aws-mysql/"
  mysql_server_name = "example123"
  password          = var.admin_password

}

variable "admin_password" {
}