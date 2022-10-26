provider "aws" {
  region = var.region
}

data "aws_subnets" "vpc_subnets" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

resource "aws_db_subnet_group" "mysql" {
  name       = var.db_subnet_group_name
  subnet_ids = data.aws_subnets.vpc_subnets.ids
  tags       = var.db_subnet_group_tag
}

resource "aws_security_group" "rds" {
  name   = var.aws_security_group_name
  vpc_id = var.vpc_id

  ingress {
    from_port   = var.ingress_from_port
    to_port     = var.ingress_to_port
    protocol    = var.ingress_protocol
    cidr_blocks = var.ingress_cidr_blocks
  }

  egress {
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = var.egress_protocol
    cidr_blocks = var.egress_cidr_blocks
  }

  tags = var.rds_security_group_tag
}

resource "aws_db_parameter_group" "mysql" {
  name   = var.db_parameter_group_name
  family = var.db_parameter_group_family

  dynamic "parameter" {
    for_each = var.parameters
    content {
      name         = parameter.value.name
      value        = parameter.value.value
      apply_method = lookup(parameter.value, "apply_method", null)
    }
  }
}
resource "aws_db_instance" "mysql_server" {
  identifier             = var.aws_database_instance_identifier
  instance_class         = var.aws_database_instance_class
  allocated_storage      = var.aws_database_allocated_storage
  engine                 = "mysql"
  username               = var.username
  password               = var.password
  parameter_group_name   = aws_db_parameter_group.tf-mysql-parameter-group.name
  skip_final_snapshot    = var.final_snapshot_identifier_prefix
  db_subnet_group_name   = aws_db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds.id]
}

