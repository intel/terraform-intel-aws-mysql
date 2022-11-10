variable "db_password" {
  description = "RDS root user password"
  sensitive   = true
}

variable "region" {
  description = "Target AWS region to deploy workloads in."
  type        = string
  default     = "us-west-2"
}