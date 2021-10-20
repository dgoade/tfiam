# load the customer managed groups from the remote state file
data "terraform_remote_state" "groups" {
  backend = "s3"
  config = {
    bucket = "dcg-terraform"
    key    = "iam/groups/terraform.tfstate"
    region = "us-east-1"
  }
}

# used merely to shorten the code lines below
locals {
  groups = data.terraform_remote_state.groups.outputs
}

# map of users with groups to add them to
locals {
  user_map = {
    dcgoade = {
      group_names : [
        local.groups.admins_group.name,
      ],
    },
    tmgoade = {
      group_names : [
        local.groups.developers_group.name,
      ],
    }
  }
}
