# This policy is here mainly so that we can attach
# it to roles.
# If you want to enable a user group to do these things,
# then you might want to create a new policy for it and
# attach the policy document of the same name from
# ../policy-documents directly to it.

data "aws_iam_policy_document" "combined_policy" {
  source_policy_documents = local.managed_policy_docs
}

resource "aws_iam_policy" "policy" {
  name   = "codeartifact-publish"
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
