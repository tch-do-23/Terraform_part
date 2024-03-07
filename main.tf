resource "aws_key_pair" "ssh-key" {
  key_name   = "ssh-key"
  public_key = file("/home/ec2-user/final_project/ssh-key.pub")
}

provider "aws" {
  region     = "us-east-1"
 

}

resource "aws_instance" "web1" {
  ami                    = var.ami
  instance_type          = var.instance-type[0]
  subnet_id              = aws_subnet.tf_subnet_1.id
  key_name               = "ssh-key"
  vpc_security_group_ids = [aws_security_group.final_project_sg.id]



  tags = {
    Name = "Ansible"
  }
}

resource "aws_instance" "web2" {
  ami                    = var.ami
  instance_type          = var.instance-type[1]
  subnet_id              = aws_subnet.tf_subnet_1.id
  key_name               = "ssh-key"
  vpc_security_group_ids = [aws_security_group.final_project_sg.id]



  tags = {
    Name = " Jenkins"
  }
}



resource "aws_instance" "web3" {
  ami                    = var.ami
  instance_type          = var.instance-type[2]
  subnet_id              = aws_subnet.tf_subnet_1.id
  key_name               = "ssh-key"
  vpc_security_group_ids = [aws_security_group.final_project_sg.id]


  tags = {
    Name = "Kubernetes"
  }
}
