variable "ami" {
  default = "ami-08a52ddb321b32a8c"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_name" {

}

variable "subnet" {

}

variable "availability_zone" {

}

variable "app_server_security_groups" {
  type = list
}
