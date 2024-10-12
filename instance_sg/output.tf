output "bastion_sg_id" {
  value       = aws_security_group.emir_bastion_sg.id
}

output "ec2_sg_id" {
  value       = aws_security_group.emir_ec2_sg.id
}

output "lb_sg_id" {
  value       = aws_security_group.emir_lb_sg.id
}
