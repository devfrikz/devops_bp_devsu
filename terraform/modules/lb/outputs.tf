output "alb_arn" {
  description = "El ARN del Application Load Balancer"
  value       = aws_lb.app_lb.arn
}

output "alb_dns_name" {
  description = "El DNS name del Application Load Balancer"
  value       = aws_lb.app_lb.dns_name
}
