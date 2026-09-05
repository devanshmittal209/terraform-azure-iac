variable "databricks_host" {
  description = "Databricks workspace URL"
  type        = string
}

variable "databricks_username" {
  description = "Databricks workspace username"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string

  validation {
    condition     = contains(["development", "staging", "production"], var.environment)
    error_message = "Environment must be development, staging, or production."
  }
}