resource "aws_security_group" "final_project_sg" {
  name        = "final_project_sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.final_project_vpc.id

  ingress {
    description = "allow ssh"
    from_port   = var.ports[1]
    to_port     = var.ports[1]
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    description = "allow 8080 "
    from_port   = var.ports[2]
    to_port     = var.ports[2]
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "final_project_sg"
  }
}
