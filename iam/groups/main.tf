provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "dcg-terraform"
    key    = "iam/groups/terraform.tfstate"
    region = "us-east-1"
  }
}

module "admins" {
  source = "./admins"
}

module "power_users" {
  source = "./power-users"
}

module "developers" {
  source = "./developers"
}

