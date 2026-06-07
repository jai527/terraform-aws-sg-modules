resource "aws_instance" "multi-resource-demo" {
    ami = local.ami_id

    instance_type = var.instance_type[local.environment]

    vpc_security_group_ids = [aws_security_group.my_sg.id]

 tags = {
    name = "${var.project}-${local.environment}"
    project = "roboshop"
    environment = local.environment
 } 
}

resource "aws_security_group" "my_sg" {
  name        = "my-security-group-${local.environment}"
  description = "Allow SSH and HTTP traffic"

  
egress {

    from_port = 0
    to_port   = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
}

ingress {

    from_port = 0
    to_port   = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
}
tags = {
    Name = "MySecurityGroup"
  }

}