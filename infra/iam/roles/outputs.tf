output "github_actions_user_name" {
  value = aws_iam_user.primeiro_usuario.name
}

output "github_actions_access_key_id" {
  value     = aws_iam_access_key.github_actions_key_primeiro_usuario.id
}
