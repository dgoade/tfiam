provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "dcg-terraform"
    key    = "iam/policy-documents/terraform.tfstate"
    region = "us-east-1"
  }
}

module "admin" {
  source = "./admin"
}

module "iam_self_managed_access" {
  source = "./iam-self-managed-access"
}

module "codeartifact_admin" {
  source = "./codeartifact-admin"
}

module "codeartifact_publish" {
  source = "./codeartifact-publish"
}
