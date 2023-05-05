# Variables we will use
 variable "ami" {
    type = string
    description = "holds ami image"
 }

 variable "app_region" {
    type = string
    default = "us-east-1"
 }

 variable "instance_type" {
    type = string
    default = "t2.micro"
 }

 # Create security group
 resource "aws_security_group" "ec20neSG" {
    name        = "ec2sg-test_web"
    description = "Allow incoming HTTP connections & SSH access"

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "${var.app_region}-sg"
    }

 }


 # Create ec2 instance
 resource "aws_instance" "app_server" {
    ami = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids = [ "${aws_security_group.ec20neSG.id}" ]
 }
