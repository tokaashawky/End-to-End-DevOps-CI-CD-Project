output vpc_id {
  value       = module.mynetwork.vpc_id
}
output "alb_dns_name" {
  value = aws_lb.public_alb.dns_name
}


output "bastion_public_ip" {
  value       = aws_instance.Bastion.public_ip
  description = "Public IP of the Bastion Host"
}

output "reverse_proxy_private_ips" {
  value       = [for instance in aws_instance.Reverse_proxy : instance.private_ip]
  description = "Private IPs of the Reverse Proxy instances"
}

output "backend_private_ips" {
  value       = [for instance in aws_instance.backend : instance.private_ip]
  description = "Private IPs of the Backend server instances"
}

output "rds_endpoint" {
  value       = aws_db_instance.RDS.endpoint
  description = "RDS database endpoint"
}

output "redis_endpoint" {
  value       = aws_elasticache_cluster.redis.cache_nodes[0].address
  description = "Primary endpoint address of the Redis cluster"
}
