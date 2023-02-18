#8 create a elastic ip
resource "aws_eip" "lb" {
  vpc                       = true
  network_interface         = aws_network_interface.multi-ip.id
  associate_with_private_ip = "10.0.1.50"
  depends_on = [aws_internet_gateway.igw]
}
