data "aws_ami" "ami" {
  owners      = ["973714476881"]
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
}

resource "aws_instance" "loadrunner" {
    ami = data.aws_ami.ami
    instance_type = "t3.medium"
    vpc_security_group_ids = ""

    tags = {
        Name = "load-runner"
    }
  
}

provisioner "remote-exec" {
    connecton {
        user = "centos"
        password = "DevOps321"
        host = self.public_ip
    }
    inline = [
        "labauto docker"
    ]
}