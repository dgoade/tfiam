provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "dcg-terraform"
    key    = "iam/policies/terraform.tfstate"
    region = "us-east-1"
  }
}

module "iam_self_managed_access_policy" {
  source = "./iam-self-managed-access"
}

module "codeartifact_publish_policy" {
  source = "./codeartifact-publish"
}

module "power_users_policy" {
  source = "./power-users"
}

module "developers_policy" {
  source = "./developers"
}
