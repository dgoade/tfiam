# This policy is a convenient way to enforce MFA
# for novel types of user or groups that we're not sure
# we'll be using for long.
# If you're thinking that we'll need to create a new
# type of user group long-term, then you might want to
# create a new policy for it and attach the policy document
# of the same name from ../policy-documents directly to it.

data "aws_iam_policy_document" "combined_policy" {
  source_policy_documents = local.managed_policy_docs
}

resource "aws_iam_policy" "policy" {
  name   = "iam-self-managed-access"
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
