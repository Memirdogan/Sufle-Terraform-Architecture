resource "aws_lb" "emir_app_lb" {
  name               = "emir-app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.emir_lb_sg.id]
  subnets = [data.terraform_remote_state.out_vpc.outputs.public_subnet_id,
  data.terraform_remote_state.out_vpc.outputs.public_subnet_id2]

  tags = {
    Name  = "App-Load-Balancer"
    Owner = "Emir"
  }
}

resource "aws_lb_listener" "emir_app_lb_listener" {
  load_balancer_arn = aws_lb.emir_app_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.emir_app_tg.arn
  }
}

resource "aws_lb_target_group" "emir_app_tg" {
  name     = "app-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state.out_vpc.outputs.vpc_id
}


resource "aws_lb_target_group_attachment" "emir_app_tg_attachment" {
  count            = 2
  target_group_arn = aws_lb_target_group.emir_app_tg.arn
  target_id        = aws_instance.emir_ec2_instances[count.index].id
  port             = 80
}

/*
resource "aws_lb_listener" "emir_app_lb_listener_https" {
  load_balancer_arn = aws_lb.emir_app_lb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"  # AWS'in varsayılan SSL politikalarından biri
  # certificate_arn   = "arn:aws:acm:region:account:certificate/certificate-id"  # Burada SSL sertifikası ARN'i yazılmalı

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.emir_app_tg.arn
  }
}
*/