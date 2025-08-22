resource "aws_iam_role" "ecs_task_execution" {
  name               = "ecs-task-execution-role"
  assume_role_policy = file("${path.module}/../policies/assume_role_ecs.json")
}

resource "aws_iam_policy" "ecs_policy" {
  name   = "ecs-task-policy"
  policy = file("${path.module}/../policies/ecs_task_policy.json")
}

resource "aws_iam_role_policy_attachment" "ecs_attach" {
  role       = aws_iam_role.ecs_task_execution.name
  policy_arn = aws_iam_policy.ecs_policy.arn
}
