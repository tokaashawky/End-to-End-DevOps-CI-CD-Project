resource "aws_db_subnet_group" "private" {
  name       = "privatesubnet"
  subnet_ids = [
    module.mynetwork.subnets["PrivateSubnet5"].id,
    module.mynetwork.subnets["PrivateSubnet6"].id 
  ]
  tags = {
    Name = "Private RDS Subnet Group"
  }
}

resource "aws_db_instance" "RDS" {
    engine               = "mysql"  
    engine_version       = "8.0"
    identifier           = "my-rds"
    availability_zone    = "${var.region}a"    
    allocated_storage    = 10           
    backup_retention_period = 0    
    skip_final_snapshot  = true
    username             = var.db_username
    password             = var.db_password
    instance_class       = var.db_instance_class
    storage_type         = var.db_S_class
    publicly_accessible  = false
    multi_az             = false  
    vpc_security_group_ids = [module.mynetwork.rds_sg]   
    db_subnet_group_name = aws_db_subnet_group.private.name

}