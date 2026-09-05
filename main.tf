provider "databricks" {
  host = var.databricks_host
}

resource "databricks_directory" "project" {
  path = "/Workspace/Users/${var.databricks_username}/terraform-iac"
}

resource "databricks_notebook" "hello" {
  path     = "${databricks_directory.project.path}/hello_databricks"
  language = "PYTHON"
  source   = "${path.module}/notebooks/hello_databricks.py"
}

resource "databricks_job" "data_processing" {
  name = "terraform-data-processing-job"

  task {
    task_key = "run_data_processing"

    notebook_task {
      notebook_path = databricks_notebook.hello.path

      base_parameters = {
        environment = var.environment
      }
    }

    max_retries               = 2
    min_retry_interval_millis = 10000
    retry_on_timeout          = true
  }

  timeout_seconds = 300
}