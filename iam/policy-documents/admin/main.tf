
data "aws_iam_policy_document" "policy_document" {
}

output "policy_document" {
  value       = data.aws_iam_policy_document.policy_document.json
  description = "policy document"
}
