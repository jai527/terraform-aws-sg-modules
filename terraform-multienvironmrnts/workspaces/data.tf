data "aws_ami" "joindevops" {

    most_recent = true
    owners = ["973714476881"]

  filter {
    name   = "name"
    
    values = ["Redhat-9-DevOps-Practice"]
  }

}

resource "aws_instance" "example" {
  ami           = data.aws_ami.joindevops.id
  instance_type = "t3.micro"


}