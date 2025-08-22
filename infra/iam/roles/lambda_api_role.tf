resource "aws_iam_role" "lambda_api" {
  name               = "lambda-api-role"
  assume_role_policy = file("${path.module}/../policies/assume_role_lambda.json")
}

resource "aws_iam_policy" "lambda_policy" {
  name   = "lambda-invoke-stepfn"
  policy = file("${path.module}/../policies/lambda_invoke_stepfn.json")
}

resource "aws_iam_role_policy_attachment" "lambda_attach" {
  role       = aws_iam_role.lambda_api.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}
