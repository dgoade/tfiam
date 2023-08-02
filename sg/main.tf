provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "dcg-terraform"
    key    = "sg/terraform.tfstate"
    region = "us-east-1"
  }
}

module "outgoing" {
  source = "./outgoing"
}

module "ssh" {
  source = "./ssh"
}

module "http" {
  source = "./http"
}

module "https" {
  source = "./https"
}

