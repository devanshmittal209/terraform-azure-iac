# Terraform + Databricks Infrastructure as Code

A hands-on Infrastructure as Code project using Terraform to provision and manage Databricks workspace resources, notebooks, and Jobs.

## Overview

This project demonstrates how Terraform can be used to manage a Databricks data-processing workflow as code.

The infrastructure includes:

- A Databricks workspace directory
- A PySpark notebook
- A Databricks Job that executes the notebook
- Configurable environment parameters
- Job retry and timeout configuration
- Terraform outputs
- GitHub Actions CI for Terraform validation and planning

## Architecture

GitHub Repository
        |
        v
GitHub Actions
        |
        v
Terraform
        |
        +----------------------+
        |                      |
        v                      v
Databricks Directory      Databricks Notebook
                               |
                               v
                         Databricks Job
                               |
                               v
                         PySpark Processing

## Technologies

- Terraform
- Databricks
- PySpark
- Python
- Git
- GitHub Actions
- Infrastructure as Code (IaC)
- CI/CD

## Terraform Resources

### Databricks Directory

Terraform creates a dedicated workspace directory for the project.

### Databricks Notebook

A Python/PySpark notebook is deployed from the repository into the Databricks workspace.

The notebook creates a small Spark DataFrame and performs a `groupBy` aggregation.

### Databricks Job

Terraform creates a Databricks Job that executes the notebook.

The Job includes:

- Maximum retries
- Retry interval
- Retry on timeout
- Execution timeout
- Environment parameter

## Configuration

Environment-specific values are supplied through Terraform variables.

For local development, values can be provided through `terraform.tfvars`.

Example:

```hcl
databricks_host     = "https://<workspace-url>"
databricks_username = "<username>"
environment         = "development"