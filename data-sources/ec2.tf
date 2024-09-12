resource "aws_security_group" "allow_ssh_terraform"{
    name        = "allow_sshh"  # becoz, allow_shh is already existed
    description = "Allow port number 22 for ssh" # optional 
    
# usually we allow everything in egress
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1" # -1 indicates everything 
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"   # -1 indicates everything 
        cidr_blocks      = ["0.0.0.0/0"]   # allowing from everyone
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "allow_sshh"
    }
}


resource "aws_instance" "terraform" {

    ami = data.aws_ami.joindevops.id 
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    tags = {
        Name = "terraform"
    }
}