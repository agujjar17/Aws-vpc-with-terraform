#7 create a network interface

resource "aws_network_interface" "multi-ip" {
  subnet_id   = aws_subnet.subnet-1.id
  private_ips = ["10.0.1.50"]
  security_groups = [aws_security_group.web.id]
}