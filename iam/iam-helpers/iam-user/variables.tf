variable "user_name" {
  description = "IAM username"
  type        = string
}

variable "group_names" {
  description = "Group names"
  type        = list(any)
}
