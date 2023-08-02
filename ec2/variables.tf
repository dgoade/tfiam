# load the security groups from the remote state file
data "terraform_remote_state" "security_groups" {
  backend = "s3"
  config = {
    bucket = "dcg-terraform"
    key    = "sg/terraform.tfstate"
    region = "us-east-1"
  }
}

# used merely to shorten the code lines below
locals {
  security_groups = data.terraform_remote_state.security_groups.outputs
}

# map of users with groups to add them to
locals {
  security_group_map = {
    webserver = {
      security_group_ids : [
        local.security_groups.outgoing_sg.id,
        local.security_groups.ssh_sg.id,
        local.security_groups.http_sg.id,
        local.security_groups.https_sg.id
      ]
    }
  }
}
