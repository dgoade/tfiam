# http
resource "aws_security_group" "nginx_webserver_http" {
  name        = "nginx-webserver-http-sg"
  description = "Allow http connections"
  revoke_rules_on_delete = false
  tags                   = {}
  vpc_id                 = "vpc-9bfe47fe"
  timeouts {}
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.nginx_webserver_http.id
  description = "Allow incoming http connections from anywhere"
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

output "id" {
  value       = aws_security_group.nginx_webserver_http.id
  description = "id of the security group"
}

output "name" {
  value       = aws_security_group.nginx_webserver_http.name
  description = "id of the security group"
}

