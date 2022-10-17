resource "aws_db_parameter_group" "tf-mysql-parameter-group" {
  name   = "tf-mysql-parameter-group"
  family = var.family


  dynamic "parameter" {
    for_each = var.parameters
    content {
      name         = parameter.value.name
      value        = parameter.value.value
      apply_method = lookup(parameter.value, "apply_method", null)
    }
  }
}
