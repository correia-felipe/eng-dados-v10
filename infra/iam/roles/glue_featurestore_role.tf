resource "aws_iam_role" "glue_featurestore" {
  name               = "glue-featurestore-role"
  assume_role_policy = file("${path.module}/../policies/assume_role_glue.json")
}

resource "aws_iam_policy" "glue_policy" {
  name   = "glue-access-policy"
  policy = file("${path.module}/../policies/glue_access_policy.json")
}

resource "aws_iam_role_policy_attachment" "glue_attach" {
  role       = aws_iam_role.glue_featurestore.name
  policy_arn = aws_iam_policy.glue_policy.arn
}
