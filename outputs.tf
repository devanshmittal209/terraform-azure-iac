output "file_path" {
  description = "Path of the managed file"
  value       = local_file.hello.filename
}