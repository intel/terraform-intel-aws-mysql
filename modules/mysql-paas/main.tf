resource "aws_db_instance" "mysql_server_sku" {
  db_name = var.mysql_server_name
  allocated_storage = var.allocated_storage
  engine = var.engine
  engine_version = var.engine_version
  instance_class = var.instance_class
  availability_zone = var.availability_zone
  iops = var.iops
  username = var.username
  password = var.password
}
