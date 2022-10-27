# terraform-intel-aws-mysql
Intel AWS MySQL Optimized Cloud Recipe

# Amazon RDS MySQL (PaaS) - Intel Cloud Optimized Recipe

Configuration in this directory creates an Amazon RDS instance for MySQL. The instance is created on an Intel Icelake instance M6i.xlarge by default. The instance is pre-configured with parameters within the database parameter group that is optimized for Intel architecture. The goal of this recipe is to get you started with a database configured to run best on Intel architecture.

As you configure your application's environment, choose the configurations for your infrastructure that matches your application's requirements.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

## Considerations
- Check in the variables.tf file for the region where this database instance will be created. It is defaulted to run in us-west-1 region within AWS. If you want to run it within any other region, make changes accordingly within the Terraform code

- Check if you getting errors while running this Terraform code due to AWS defined soft limits or hard limits within your AWS account. Please work with your AWS support team to resolve limit constraints


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.34.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.mysql_server](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_parameter_group.mysql](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group) | resource |
| [aws_db_parameter_group.tf-mysql-parameter-group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group) | resource |
| [aws_db_subnet_group.mysql](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_security_group.rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnets.vpc_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | The Availability Zone of the RDS instance | `string` | `null` | no |
| <a name="input_aws_database_allocated_storage"></a> [aws\_database\_allocated\_storage](#input\_aws\_database\_allocated\_storage) | The allocated storage in gibibytes. | `string` | `400` | no |
| <a name="input_aws_database_instance_class"></a> [aws\_database\_instance\_class](#input\_aws\_database\_instance\_class) | The instance type of the RDS instance. | `string` | `"db.m6i.8xlarge"` | no |
| <a name="input_aws_database_instance_identifiere"></a> [aws\_database\_instance\_identifiere](#input\_aws\_database\_instance\_identifiere) | n/a | `string` | `"mysql"` | no |
| <a name="input_aws_database_skip_final_prefix"></a> [aws\_database\_skip\_final\_prefix](#input\_aws\_database\_skip\_final\_prefix) | The name which is prefixed to the final snapshot on cluster destroy | `string` | `"final"` | no |
| <a name="input_aws_security_group_name"></a> [aws\_security\_group\_name](#input\_aws\_security\_group\_name) | security group name for the rds | `string` | `"mysql_rds"` | no |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file.<br>  The password provided will not be used if the variable create\_random\_password is set to true. | `string` | n/a | yes |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | db subnet group name | `string` | `"mysql"` | no |
| <a name="input_db_subnet_group_tag"></a> [db\_subnet\_group\_tag](#input\_db\_subnet\_group\_tag) | tag for db subnet group | `map(string)` | <pre>{<br>  "Name": "mysql"<br>}</pre> | no |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | Username for the master DB user | `string` | `"mysqladmin"` | no |
| <a name="input_egress_cidr_blocks"></a> [egress\_cidr\_blocks](#input\_egress\_cidr\_blocks) | egress cidr block for rds security group | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_egress_from_port"></a> [egress\_from\_port](#input\_egress\_from\_port) | egress from port for rds security group | `number` | `5432` | no |
| <a name="input_egress_protocol"></a> [egress\_protocol](#input\_egress\_protocol) | egress protocol for rds security group | `string` | `"tcp"` | no |
| <a name="input_egress_to_port"></a> [egress\_to\_port](#input\_egress\_to\_port) | egress from port for rds security group | `number` | `5432` | no |
| <a name="input_family"></a> [family](#input\_family) | n/a | `string` | `"mysql8.0"` | no |
| <a name="input_ingress_cidr_blocks"></a> [ingress\_cidr\_blocks](#input\_ingress\_cidr\_blocks) | ingress cidr block for rds security group | `list(string)` | <pre>[<br>  "192.55.54.51/32"<br>]</pre> | no |
| <a name="input_ingress_from_port"></a> [ingress\_from\_port](#input\_ingress\_from\_port) | ingress from port for rds security group | `number` | `5432` | no |
| <a name="input_ingress_protocol"></a> [ingress\_protocol](#input\_ingress\_protocol) | ingress protocol for rds security group | `string` | `"tcp"` | no |
| <a name="input_ingress_to_port"></a> [ingress\_to\_port](#input\_ingress\_to\_port) | ingress from port for rds security group | `number` | `5432` | no |
| <a name="input_iops"></a> [iops](#input\_iops) | The amount of provisioned IOPS. Setting this implies a storage\_type of 'io1' | `number` | `3000` | no |
| <a name="input_max_connections"></a> [max\_connections](#input\_max\_connections) | Max connections | `number` | `4000` | no |
| <a name="input_mysql_server_name"></a> [mysql\_server\_name](#input\_mysql\_server\_name) | MySQL server name | `string` | n/a | yes |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | A list of DB parameter maps to apply | `list(map(string))` | <pre>[<br>  {<br>    "name": "table_open_cache",<br>    "value": 8000<br>  },<br>  {<br>    "apply_method": "pending-reboot",<br>    "name": "table_open_cache_instances",<br>    "value": 16<br>  },<br>  {<br>    "name": "max_connections",<br>    "value": 4000<br>  },<br>  {<br>    "apply_method": "pending-reboot",<br>    "name": "back_log",<br>    "value": 1500<br>  },<br>  {<br>    "name": "default_password_lifetime",<br>    "value": 0<br>  },<br>  {<br>    "apply_method": "pending-reboot",<br>    "name": "performance_schema",<br>    "value": "OFF"<br>  },<br>  {<br>    "name": "max_prepared_stmt_count",<br>    "value": 128000<br>  },<br>  {<br>    "name": "character_set_server",<br>    "value": "latin1"<br>  },<br>  {<br>    "name": "collation_server",<br>    "value": "latin1_swedish_ci"<br>  },<br>  {<br>    "name": "transaction_isolation",<br>    "value": "REPEATABLE-READ"<br>  },<br>  {<br>    "apply_method": "pending-reboot",<br>    "name": "innodb_log_file_size",<br>    "value": 1073741824<br>  },<br>  {<br>    "apply_method": "pending-reboot",<br>    "name": "innodb_open_files",<br>    "value": 4000<br>  },<br>  {<br>    "apply_method": "pending-reboot",<br>    "name": "innodb_buffer_pool_instances",<br>    "value": 16<br>  },<br>  {<br>    "apply_method": "pending-reboot",<br>    "name": "innodb_log_buffer_size",<br>    "value": 67108864<br>  },<br>  {<br>    "name": "innodb_thread_concurrency",<br>    "value": 0<br>  },<br>  {<br>    "name": "innodb_flush_log_at_trx_commit",<br>    "value": 0<br>  },<br>  {<br>    "name": "innodb_max_dirty_pages_pct",<br>    "value": 90<br>  },<br>  {<br>    "name": "innodb_max_dirty_pages_pct_lwm",<br>    "value": 10<br>  },<br>  {<br>    "name": "join_buffer_size",<br>    "value": 32768<br>  },<br>  {<br>    "name": "sort_buffer_size",<br>    "value": 32768<br>  },<br>  {<br>    "apply_method": "pending-reboot",<br>    "name": "innodb_use_native_aio",<br>    "value": 1<br>  },<br>  {<br>    "name": "innodb_stats_persistent",<br>    "value": 1<br>  },<br>  {<br>    "name": "innodb_spin_wait_delay",<br>    "value": 6<br>  },<br>  {<br>    "name": "innodb_max_purge_lag_delay",<br>    "value": 300000<br>  },<br>  {<br>    "name": "innodb_max_purge_lag",<br>    "value": 0<br>  },<br>  {<br>    "name": "innodb_checksum_algorithm",<br>    "value": "none"<br>  },<br>  {<br>    "name": "innodb_io_capacity",<br>    "value": 4000<br>  },<br>  {<br>    "name": "innodb_io_capacity_max",<br>    "value": 20000<br>  },<br>  {<br>    "name": "innodb_lru_scan_depth",<br>    "value": 9000<br>  },<br>  {<br>    "name": "innodb_change_buffering",<br>    "value": "none"<br>  },<br>  {<br>    "apply_method": "pending-reboot",<br>    "name": "innodb_page_cleaners",<br>    "value": 4<br>  },<br>  {<br>    "name": "innodb_undo_log_truncate",<br>    "value": "off"<br>  },<br>  {<br>    "name": "innodb_adaptive_flushing",<br>    "value": 1<br>  },<br>  {<br>    "name": "innodb_flush_neighbors",<br>    "value": 0<br>  },<br>  {<br>    "apply_method": "pending-reboot",<br>    "name": "innodb_read_io_threads",<br>    "value": 16<br>  },<br>  {<br>    "apply_method": "pending-reboot",<br>    "name": "innodb_write_io_threads",<br>    "value": 16<br>  },<br>  {<br>    "apply_method": "pending-reboot",<br>    "name": "innodb_purge_threads",<br>    "value": 4<br>  },<br>  {<br>    "name": "innodb_adaptive_hash_index",<br>    "value": 0<br>  }<br>]</pre> | no |
| <a name="input_rds_security_group_tag"></a> [rds\_security\_group\_tag](#input\_rds\_security\_group\_tag) | tag for rds security group | `map(string)` | <pre>{<br>  "Name": "mysql_rds"<br>}</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | `"us-west-1"` | no |
| <a name="input_test"></a> [test](#input\_test) | This is a test variable, test2 | `any` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | id of the vpc | `string` | `"vpc-043b378a6196bbd10"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_address"></a> [address](#output\_address) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_username"></a> [username](#output\_username) | n/a |
<!-- END_TF_DOCS -->