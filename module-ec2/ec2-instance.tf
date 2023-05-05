 resource "aws_instance" "app_server" {
    ami = var.ami
 }

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