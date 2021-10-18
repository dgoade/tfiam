# Manages IAM Users in our AWS Account

provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "dcg-terraform"
    key    = "iam/users/terraform.tfstate"
    region = "us-east-1"
  }
}

module "iam_user" {
  source      = "../iam-helpers/iam-user"
  for_each    = local.user_map
  user_name   = each.key
  group_names = tolist(each.value.group_names)
}
