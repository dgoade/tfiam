resource "aws_iam_group" "developers" {
  name = "developers"
}

# first, we attach the AWS-managed Policies they need
resource "aws_iam_group_policy_attachment" "aws_managed_attachments" {
  for_each   = toset(var.aws_managed_policy_arns)
  group      = aws_iam_group.developers.name
  policy_arn = each.key
}

# next, we attach the customer managed policies they need
resource "aws_iam_group_policy_attachment" "managed_attachments" {
  for_each   = toset(local.managed_policy_arns)
  group      = aws_iam_group.developers.name
  policy_arn = each.key
}

output "arn" {
  value       = aws_iam_group.developers.arn
  description = "arn of the group"
}

output "name" {
  value       = aws_iam_group.developers.name
  description = "name of the group"
}
