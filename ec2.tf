resource "aws_instance" "web-server-instance" {
  
  ami           = "ami-0e472ba40eb589f49"
  instance_type = "t2.micro"
  availability_zone = "us-east-1a" # Use the same availability zone as the one used in the subnet
  key_name = "main-key" # Create a key pair in the EC2 management portal

  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.web-server-nic.id

  }

   # To troubleshoot the user_data scripts check the logs on the machine: /var/log/cloud-init-output.log
   user_data = <<-EOF
                 #!/bin/bash -xe
                 apt update -y
                 apt install apache2 -y
                 sudo systemctl start apache2
                 bash -c 'echo your very first web server > /var/www/html/index.html'
                 EOF

  tags = {
    Name = "web-server"
  }
}