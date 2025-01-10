resource "aws_ecr_repository" "skillup_repo" {
  name = var.my_repository_name

 # lifecycle {
#    prevent_destroy = true
 # }

  # tags = {
  #   owner   = var.owner_email
  #   duedate = var.due_date
  # }
}

resource "aws_ecr_lifecycle_policy" "skillup_repo_lifecycle" {
  repository = aws_ecr_repository.skillup_repo.name
  policy = <<POLICY
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Expire untagged images after 30 days",
      "selection": {
        "tagStatus": "untagged",
        "countType": "sinceImagePushed",
        "countUnit": "days",
        "countNumber": 30
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
POLICY
}
