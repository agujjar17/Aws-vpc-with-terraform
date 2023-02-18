#9 create a ec2 instance

resource "aws_instance" "web" {
  ami               = "ami-0557a15b87f6559cf"
  instance_type     = "t2.micro"
  key_name          = "abhishek-keys"
  availability_zone = "us-east-1a"
  network_interface {
    network_interface_id = aws_network_interface.multi-ip.id
    device_index         = 0
  }
  user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt install apache2 -y
                sudo systemctl start apache2
                sudo bash -c 'echo first web server with terraform > /var/www/html/index.html' 
  EOF

  tags = {
    Name = "Ubuntu-terraform"
  }
}
