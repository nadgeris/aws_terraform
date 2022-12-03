output "rds_endpoint" {
  description = "endpoint"
  value       = module.rds.rds_endpoint
}

output "rds_password" {
  value       = module.rds.rds_password
  description = "password"
}