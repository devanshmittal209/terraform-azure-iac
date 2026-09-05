output "databricks_directory_path" {
  description = "Path of the Terraform-managed Databricks directory"
  value       = databricks_directory.project.path
}

output "databricks_notebook_path" {
  description = "Path of the Terraform-managed Databricks notebook"
  value       = databricks_notebook.hello.path
}

output "databricks_job_id" {
  description = "ID of the Terraform-managed Databricks Job"
  value       = databricks_job.data_processing.id
}

output "databricks_job_url" {
  description = "URL of the Terraform-managed Databricks Job"
  value       = databricks_job.data_processing.url
}