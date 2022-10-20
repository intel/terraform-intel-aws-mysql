# terraform-intel-aws-mysql
Intel AWS MySQL Optimized Cloud Recipe

# Amazon RDS PostgreSQL (PaaS) - Intel Cloud Optimized Recipe

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

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | Latest Version |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|

## Resources

| Name | Type |
|------|------|
| [aws_db_subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | data source |
| [aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | data source |
| [aws_db_parameter_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group) | data source |
| [aws_db_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | data source |

## Inputs

- Database password 
- Server name

## Outputs

| Name | Description |
|------|-------------|
| <a name="id"></a> [id](#output\_rds\_hostname) | RDS instance id |
| <a name ="address"></a> [address] (output\_rds\_address) RDS instance hostname | 
| <a name="username"></a> [rds_username](#output\_rds\_username) | RDS instance root username |
