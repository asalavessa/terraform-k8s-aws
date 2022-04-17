resource "aws_eip" "one" {
  vpc                       = true
  network_interface         = aws_network_interface.web-server-nic.id
  associate_with_private_ip = "10.0.1.50"
  #instance = aws_instance.web-server-instance.id

  depends_on = [
    aws_internet_gateway.gateway
  ]

}