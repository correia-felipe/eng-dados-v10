resource "aws_iam_role" "step_function_inference" {
  name               = "step-function-inferencia-role"
  assume_role_policy = file("${path.module}/../policies/assume_role_stepfn.json")
}

resource "aws_iam_policy" "stepfn_policy" {
  name   = "step-function-execution-policy"
  policy = file("${path.module}/../policies/state_machine_execution_policy.json")
}

resource "aws_iam_role_policy_attachment" "stepfn_attach" {
  role       = aws_iam_role.step_function_inference.name
  policy_arn = aws_iam_policy.stepfn_policy.arn
}
