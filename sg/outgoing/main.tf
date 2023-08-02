# outgoing
resource "aws_security_group" "nginx_webserver_outgoing" {
  name        = "nginx-webserver-outgoing-sg"
  description = "Allow outgoing connections"
  revoke_rules_on_delete = false
  tags                   = {}
  vpc_id                 = "vpc-9bfe47fe"
  timeouts {}
}

resource "aws_vpc_security_group_egress_rule" "outgoing" {
  security_group_id = aws_security_group.nginx_webserver_outgoing.id
  description = "Allow all outgoing connections"
  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}

output "id" {
  value       = aws_security_group.nginx_webserver_outgoing.id
  description = "id of the security group"
}

output "name" {
  value       = aws_security_group.nginx_webserver_outgoing.name
  description = "id of the security group"
}
