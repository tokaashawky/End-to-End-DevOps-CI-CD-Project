
resource "aws_lb" "public_alb" {
 name               = "public-alb"
 internal           = false
 load_balancer_type = "application"
 security_groups    = [module.mynetwork.Public_alb_sg]
 subnets  = [
    module.mynetwork.subnets["PublicSubnet1"].id,
    module.mynetwork.subnets["PublicSubnet2"].id
 ]
}
resource "aws_lb_listener" "public_alb_listener" {
 load_balancer_arn = aws_lb.public_alb.arn
 port              = "80"
 protocol          = "HTTP"
 default_action {
   type             = "forward"
   target_group_arn = aws_lb_target_group.public_tg.arn
 }
}
resource "aws_lb_target_group" "public_tg" { 
 name     = "public-target-group"
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

resource "aws_lb_target_group_attachment" "public_tg_attachment" {
  count            = 2
  target_group_arn = aws_lb_target_group.public_tg.arn
  target_id        = aws_instance.Reverse_proxy[count.index].id
  port             = 80
}
