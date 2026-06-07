resource "aws_instance" "example" {
  ami           = "ami-0220d79f3f480ecf5" 
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  tags = {
    Name = "MyTerraform-${var.environment}"
    project = "roboshop"
  }
}

resource "aws_security_group" "my_sg" {
  name        = "my-security-group-${var.environment}"
  description = "Allow SSH and HTTP traffic"

  ingress {
    description = "Allow SSH"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"] 
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"] 
  }

  tags = {
    Name = "MySecurityGroup-${var.environment}"
  }
}