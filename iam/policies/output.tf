output "admins" {
  value = module.admins_policy
}

output "iam_self_managed_access" {
  value = module.iam_self_managed_access_policy
}

output "codeartifact_publish" {
  value = module.codeartifact_publish_policy
}

output "power_users" {
  value = module.power_users_policy
}

output "developers" {
  value = module.developers_policy
}
