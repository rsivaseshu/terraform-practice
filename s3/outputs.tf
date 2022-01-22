output "user_name" {
  description = "The name of the bucket."
  value       = aws_iam_user.dev-user.name
}

output "user_arn" {
  description = "The arn of the bucket."
  value       = aws_iam_user.dev-user.arn
}