# https
resource "aws_security_group" "nginx_webserver_https" {
  name        = "nginx-webserver-https-sg"
  description = "Allow https connections"
  revoke_rules_on_delete = false
  tags                   = {}
  vpc_id                 = "vpc-9bfe47fe"
  timeouts {}
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.nginx_webserver_https.id
  description = "Allow https connections from anywhere"
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 443
  ip_protocol = "tcp"
  to_port     = 443
}

output "id" {
  value       = aws_security_group.nginx_webserver_https.id
  description = "id of the security group"
}

output "name" {
  value       = aws_security_group.nginx_webserver_https.name
  description = "id of the security group"
}
