data "aws_iam_policy_document" "combined_policy" {
  source_policy_documents = local.managed_policy_docs
}

resource "aws_iam_policy" "policy" {
  name   = "admins"
  path   = "/"
  policy = data.aws_iam_policy_document.combined_policy.json
}

output "arn" {
  value       = aws_iam_policy.policy.arn
  description = "arn of the policy"
}

output "name" {
  value       = aws_iam_policy.policy.name
  description = "name of the policy"
}
