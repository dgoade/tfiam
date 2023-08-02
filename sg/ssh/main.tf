# ssh
resource "aws_security_group" "nginx_webserver_ssh" {
  name        = "nginx-webserver-ssh-sg"
  description = "Allow ssh connections"
  revoke_rules_on_delete = false
  tags                   = {}
  vpc_id                 = "vpc-9bfe47fe"
  timeouts {}
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.nginx_webserver_ssh.id
  description = "Allow ssh connections from DB Labs Office"
  cidr_ipv4   = "70.106.255.8/32"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

output "id" {
  value       = aws_security_group.nginx_webserver_ssh.id
  description = "id of the security group"
}

output "name" {
  value       = aws_security_group.nginx_webserver_ssh.name
  description = "id of the security group"
}
