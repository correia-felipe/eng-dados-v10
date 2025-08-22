resource "aws_iam_user" "primeiro_usuario" {
  name = "primeiro_usuario"
  tags = {
    CreatedBy   = "terraform"
    Environment = "governance"
  }
}

resource "aws_iam_policy" "primeiro_usuario_policy" {
  name   = "primeiro-usuario-policy"
  policy = file("${path.module}/../policies/terraform_deploy_policy.json")
}

resource "aws_iam_user_policy_attachment" "github_actions_primeiro_usuario_attach" {
  user       = aws_iam_user.github_actionss.name
  policy_arn = aws_iam_policy.terraform_deploy_policyy.arn
}

resource "aws_iam_access_key" "github_actions_key_primeiro_usuario" {
  user = aws_iam_user.github_actionss.name
}
