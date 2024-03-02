resource "aws_eip" "test1" {
  instance = aws_instance.web1.id
  domain   = "vpc"
  tags = {
    Name = "test_ip1"
  }
}

resource "aws_eip" "test2" {
  instance = aws_instance.web2.id
  domain   = "vpc"
  tags = {
    Name = "test_ip2"
  }
}

resource "aws_eip" "test3" {
  instance = aws_instance.web3.id
  domain   = "vpc"
  tags = {
    Name = "test_ip3"
  }
}
