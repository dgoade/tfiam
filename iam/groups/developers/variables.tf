# Leverage AWS-Managed Policies as much as possible
# but try to keep it no more than 8 so that we can attach
# at least two of our own managed policies because the limit
# is ten policies per group.
variable "aws_managed_policy_arns" {
  description = "AWS Managed Policy ARNS for Developers"
  type        = list(any)
  default = [
    "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess",
    "arn:aws:iam::aws:policy/AmazonVPCReadOnlyAccess",
    "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess",
  ]
}

# load the customer managed policies from the remote state file
data "terraform_remote_state" "policies" {
  backend = "s3"
  config = {
    bucket = "dcg-terraform"
    key    = "iam/policies/terraform.tfstate"
    region = "us-east-1"
  }
}

# used merely to shorten the code lines below
locals {
  policies = data.terraform_remote_state.policies.outputs
}

# define the list of customer managed policies they'll need
locals {
  managed_policy_arns = [
    local.policies.developers.arn,
  ]
}
