# This is not the module you're looking for.
# We don't maintain our IAM users here. This is
# helper module to make it easier for us to do that.

# If you need to add / remove IAM users, check
# ../users/variables.tf

# This module creates a single iam user and adds it
# to a list of groups. this enables us to maintain
# all users and groups that they should be included
# in from a single, separate module.

resource "aws_iam_user" "iam_username" {
  force_destroy = "false"
  name          = var.user_name
  path          = "/"
}

# using the user's name from the above resource instead
# of the module's user_name variable establishes the
# relationship between the user and its group memberships
# so that we don't encounter a race condition; tf creates
# the user first and then adds it to the groups.
# reference: https://github.com/hashicorp/terraform/issues/8802
resource "aws_iam_user_group_membership" "group_memberships" {
  user   = aws_iam_user.iam_username.name
  groups = tolist(var.group_names)
}
