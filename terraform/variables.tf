variable "username" {
  default = "nidio"
}

variable "regiao" {
  default = "ca-central-1"
}

variable "ami" {
  default = "ami-0abc4c35ba4c005ca"
}

variable "tipoinstancia" {
  default = "t2.micro"
}

variable "subrede_pub" {
  default = "subnet-09320b92f427c327f"
}

variable "bloco_vpc" {
  default = "10.0.0.0/16"
}

variable "bloco_internet" {
  default = "0.0.0.0/0"
}

variable "vpc_id" {
  default = "vpc-08f5bcd720d50c4f3"
}