
resource "aws_lb" "private_alb" {
 name               = "private-alb"
 internal           = true
 load_balancer_type = "application"
 security_groups    = [module.mynetwork.private_alb_sg]
 subnets  = [
    module.mynetwork.subnets["PrivateSubnet3"].id,
    module.mynetwork.subnets["PrivateSubnet4"].id
 ]
}
resource "aws_lb_listener" "private_alb_listener" {
 load_balancer_arn = aws_lb.private_alb.arn
 port              = "80"
 protocol          = "HTTP"
 default_action {
   type             = "forward"
   target_group_arn = aws_lb_target_group.private_tg.arn
 }
}
resource "aws_lb_target_group" "private_tg" { 
 name     = "private-target-group"
 port     = 80
 protocol = "HTTP"
 vpc_id   = module.mynetwork.vpc_id
 health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_target_group_attachment" "private_tg_attachment" {
  count            = 2
  target_group_arn = aws_lb_target_group.private_tg.arn
  target_id        = aws_instance.backend[count.index].id
  port             = 80
}
