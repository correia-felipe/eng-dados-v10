resource "aws_iam_user" "github_actions_felipe" {
  name = "github-actions-felipe-deploy"
  tags = {
    CreatedBy   = "terraform"
    Environment = "governance"
  }
}

resource "aws_iam_policy" "terraform_deploy_policy_felipee" {
  name   = "terraform-deploy-policy_felip2ee"
  policy = file("${path.module}/../policies/terraform_deploy_policy.json")
}

resource "aws_iam_user_policy_attachment" "github_actions_felipe_attach" {
  user       = aws_iam_user.github_actions_felipe.name
  policy_arn = aws_iam_policy.terraform_deploy_policy_felipee.arn
}

resource "aws_iam_access_key" "github_actions_felipe_key_felipe" {
  user = aws_iam_user.github_actions_felipe.name
}
