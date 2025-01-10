output "subnets" {
  description = "List of subnet IDs"
  value       = aws_subnet.subnet[*].id
}

output "alb_security_group_id" {
  description = "The security group ID for the ALB"
  value       = aws_security_group.default.id
}

output "security_group_id" {
  description = "The security group ID for the ALB"
  value       = aws_security_group.default.id
}




output "vpc_id" {
  value       = aws_vpc.main.id

}
