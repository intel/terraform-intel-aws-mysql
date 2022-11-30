# intel-optimized-mysql-server

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.36.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_optimized-mysql-server"></a> [optimized-mysql-server](#module\_optimized-mysql-server) | ../../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | Password for the master database user. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Target AWS region to deploy workloads in. | `string` | `"us-east-2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_class"></a> [instance\_class](#output\_instance\_class) | Instance class in use for the database instance that was created. |
| <a name="output_mysql_address"></a> [mysql\_address](#output\_mysql\_address) | MySQL instance hostname |
| <a name="output_mysql_allocated_storage"></a> [mysql\_allocated\_storage](#output\_mysql\_allocated\_storage) | Storage that was allocated to the instance when it configured. |
| <a name="output_mysql_arn"></a> [mysql\_arn](#output\_mysql\_arn) | ARN of the database instance. |
| <a name="output_mysql_backup_window"></a> [mysql\_backup\_window](#output\_mysql\_backup\_window) | Configured backup window for the database instance. |
| <a name="output_mysql_db_name"></a> [mysql\_db\_name](#output\_mysql\_db\_name) | Name of the database that was created (if specified) during instance creation. |
| <a name="output_mysql_endpoint"></a> [mysql\_endpoint](#output\_mysql\_endpoint) | Connection endpoint for the MySQL instance that has been created |
| <a name="output_mysql_engine"></a> [mysql\_engine](#output\_mysql\_engine) | Database instance engine that was configured. |
| <a name="output_mysql_kms_key_id"></a> [mysql\_kms\_key\_id](#output\_mysql\_kms\_key\_id) | KMS key that is configured on the database instance if storage encryption is enabled. |
| <a name="output_mysql_maintenance_window"></a> [mysql\_maintenance\_window](#output\_mysql\_maintenance\_window) | Maintainence window for the database instance. |
| <a name="output_mysql_max_allocated_storage"></a> [mysql\_max\_allocated\_storage](#output\_mysql\_max\_allocated\_storage) | Maximum storage allocation that is configured on the database instance. |
| <a name="output_mysql_password"></a> [mysql\_password](#output\_mysql\_password) | MySQL instance master password. |
| <a name="output_mysql_port"></a> [mysql\_port](#output\_mysql\_port) | MySQL instance port |
| <a name="output_mysql_status"></a> [mysql\_status](#output\_mysql\_status) | Status of the database instance that was created. |
| <a name="output_mysql_username"></a> [mysql\_username](#output\_mysql\_username) | MySQL instance root username |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
