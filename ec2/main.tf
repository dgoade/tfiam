provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "dcg-terraform"
    key    = "ec2/terraform.tfstate"
    region = "us-east-1"
  }

}

resource "aws_key_pair" "admin" {
  key_name   = "nginx-webserver-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHS9JLNRRflE49o7kukcbgaC6/52Hltba/GjMFj04kZ9"
}

resource "aws_instance" "web" {
  ami           = "ami-02757d5d2fd718199"
  instance_type = "t3.micro"

  tags = {
    Name = "webserver"
  }
  vpc_security_group_ids = local.security_group_map.webserver.security_group_ids
  key_name = aws_key_pair.admin.key_name
}
