variable "region" {
  description = "Target AWS region to deploy workloads in."
  type        = string
  default     = "us-east-2"
}

variable "db_password" {
  description = "Password for the master database user."
  type        = string
  sensitive   = true
}
