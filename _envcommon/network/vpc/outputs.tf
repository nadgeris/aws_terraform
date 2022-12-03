output "app_private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.app_private_subnet_ids
}
output "app_public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.app_public_subnet_ids
}
output "rds_private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.rds_private_subnet_ids
}
output "rds_public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.rds_public_subnet_ids
}
output "monitor_private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.monitor_private_subnet_ids
}
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.id
}
output "vpc_cidr" {
  description = "The entire CIDR block for the VPC"
  value       = module.vpc.vpc_cidr
}
output "zone_id" {
   value = data.aws_route53_zone.selected.zone_id
}
output "private_route_table_ids" {
  description = "The ID of the default route table"
  value       = [module.vpc.private_route_table]
}
output "public_route_table_ids" {
  description = "The ID of the default route table"
  value       = [module.vpc.public_route_table]
}

