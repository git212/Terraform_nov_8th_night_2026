resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id = local.sub_ids[0]
  vpc_security_group_ids = [aws_security_group.web.id]
  associate_public_ip_address = true
  key_name = "Sunday_Devops"

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_security_group" "web" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

dynamic "ingress" {
  for_each = var.web_sg_rules
  content {
    description = "some description"
    from_port = ingress.value["port"]
    to_port = ingress.value["port"]
    protocol = ingress.value["protocol"]
    cidr_blocks = ingress.value["cidr_blocks"]


  }
}

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Bhc-web-demo16"
  }
}

