data "aws_iam_policy" "AWSCodeCommitPowerUser" {
  arn = "arn:aws:iam::aws:policy/AWSCodeArtifactAdminAccess"
}

output "policy_document" {
  value       = data.aws_iam_policy.AWSCodeCommitPowerUser.policy
  description = "policy document"
}
