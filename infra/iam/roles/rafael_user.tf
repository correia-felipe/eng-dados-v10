resource "aws_iam_user" "primeiro_usuario_rafael" {
  name = "rafael-gensen"
  tags = {
    CreatedBy   = "terraform"
    Environment = "governance"
  }
}

resource "aws_iam_policy" "primeiro_usuario_rafael_policy" {
  name   = "primeiro-usuario-policy"
  policy = file("${path.module}/../policies/terraform_deploy_policy.json")
}

resource "aws_iam_user_policy_attachment" "github_actions_primeiro_usuario_rafael_attach" {
  user       = aws_iam_user.primeiro_usuario_rafael.name
  policy_arn = aws_iam_policy.primeiro_usuario_rafael_policy.arn
}

resource "aws_iam_access_key" "github_actions_key_primeiro_usuario_rafael" {
  user = aws_iam_user.primeiro_usuario_rafael.name
}
