output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet" {
  description = "Public subnet"
  value       = aws_subnet.public.cidr_block
}

output "private_subnets" {
  description = "List of private subnets"
  value       = aws_subnet.private_app.cidr_block
}

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.app_alb.dns_name
}

output "db_endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.db.endpoint
}