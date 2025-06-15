output subnets {
  value       = aws_subnet.subnets_m
}

output vpc_id {
  value       = aws_vpc.MyVPC.id
}

output Bastion_sg {
  value       = aws_security_group.Bastion_sg.id
}

output Public_alb_sg {
  value       = aws_security_group.Public_alb_sg.id
}

output worker_sg {
  value       = aws_security_group.worker_sg.id
}

output private_alb_sg {
  value       = aws_security_group.private_alb_sg.id
}

output backend_sg {
  value       = aws_security_group.backend_sg.id
}

output rds_sg {
  value       = aws_security_group.rds_sg.id
}

output redis_sg {
  value       = aws_security_group.redis_sg.id
}

