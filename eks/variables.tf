variable "cluster_name" {
  type = string
  default = "lab"
}

variable availability_zones {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable subnet_ids {
  type  = list(string)
  default = ["subnet-a9591dcc", "subnet-9ddcc5b5", "subnet-943fe0e3"]
}