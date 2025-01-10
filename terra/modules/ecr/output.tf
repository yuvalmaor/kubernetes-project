output "repo" {
  value       = aws_ecr_repository.skillup_repo
  description = "DNS name of the Application Load Balancer"
}

output "link" {
  value       = aws_ecr_repository.skillup_repo.repository_url
  description = "DNS name of the Application Load Balancer"
}
