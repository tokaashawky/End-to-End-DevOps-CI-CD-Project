output "endpoint" {
  value       = aws_db_instance.this.endpoint
  description = "RDS endpoint"
}

output "db_name" {
  value = aws_db_instance.this.db_name
}

output "username" {
  value = aws_db_instance.this.username
}
