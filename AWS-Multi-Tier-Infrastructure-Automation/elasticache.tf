resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name       = "redis-subnet-group"
  subnet_ids = [
    module.mynetwork.subnets["PrivateSubnet5"].id,
    module.mynetwork.subnets["PrivateSubnet6"].id 
  ]
  tags = {
    Name = "Private REDIS Subnet Group"
  }
}
resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "my-redis"
  engine               = "redis"
  engine_version       = "7.1"
  node_type            = "cache.t3.micro"
  parameter_group_name = "default.redis7"
  snapshot_retention_limit = 0
  num_cache_nodes      = 1
  port                 = 6379
  auto_minor_version_upgrade = false
  subnet_group_name    = aws_elasticache_subnet_group.redis_subnet_group.name
  security_group_ids   = [module.mynetwork.redis_sg]
  tags = {
    Name = "my-redis"
  }
}

