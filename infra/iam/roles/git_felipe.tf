resource "aws_iam_user" "github_actionss" {
  name = "github-actions-deploy-felipeeeee"
  tags = {
    CreatedBy   = "terraform"
    Environment = "governance"
  }
}

resource "aws_iam_policy" "terraform_deploy_policyy" {
  name   = "terraform-deploy-policyyyyy"
  policy = file("${path.module}/../policies/terraform_deploy_policy.json")
}

resource "aws_iam_user_policy_attachment" "github_actions_attachh" {
  user       = aws_iam_user.github_actionss.name
  policy_arn = aws_iam_policy.terraform_deploy_policyy.arn
}

resource "aws_iam_access_key" "github_actions_key" {
  user = aws_iam_user.github_actionss.name
}
