resource "aws_db_instance" "mysql_server" {
  db_name                   = var.mysql_server_name
  allocated_storage         = var.allocated_storage
  engine                    = var.engine
  instance_class            = var.instance_class
  availability_zone         = var.availability_zone
  iops                      = var.iops
  username                  = var.username
  password                  = var.password
  final_snapshot_identifier = var.final_snapshot_identifier_prefix
  parameter_group_name      = aws_db_parameter_group.tf-mysql-parameter-group.name
}

