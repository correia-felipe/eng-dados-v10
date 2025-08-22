resource "aws_iam_user" "github_actionssss" {
  name = "github-actions-deployyyy"
  tags = {
    CreatedBy   = "terraform"
    Environment = "governance"
  }
}

resource "aws_iam_policy" "terraform_deploy_policy" {
  name   = "terraform-deploy-policy"
  policy = file("${path.module}/../policies/terraform_deploy_policy.json")
}

resource "aws_iam_user_policy_attachment" "github_actions_attach" {
  user       = aws_iam_user.github_actionssss.name
  policy_arn = aws_iam_policy.terraform_deploy_policy.arn
}

resource "aws_iam_access_key" "github_actions_keyy" {
  user = aws_iam_user.github_actionssss.name
}
