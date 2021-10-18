# load the customer managed policy documents from the remote state file
data "terraform_remote_state" "policy_docs" {
  backend = "s3"
  config = {
    bucket = "dcg-terraform"
    key    = "iam/policy-documents/terraform.tfstate"
    region = "us-east-1"
  }
}

# used merely to shorten the code lines below
locals {
  policy_docs = data.terraform_remote_state.policy_docs.outputs
}

# define the list of customer managed policy docs we need
locals {
  managed_policy_docs = [
    local.policy_docs.iam_self_managed_access.policy_document,
  ]
}
