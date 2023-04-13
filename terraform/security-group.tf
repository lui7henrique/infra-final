resource "aws_security_group" "acesso_total_local" {
  vpc_id      = var.vpc_id
  description = "liberacao de SSH para rede da VPC"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.bloco_vpc]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.bloco_internet]
  }

  tags = {
    "Name" = "${var.username}-acesso_total_local"
  }
}

resource "aws_security_group" "ssh_publico" {
  vpc_id = var.vpc_id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.bloco_internet]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.bloco_internet]
  }
  tags = {
    "Name" = "${var.username}-ssh_publico"
  }
}

resource "aws_security_group" "acesso_web" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.bloco_internet]
  }
  tags = {
    "Name" = "${var.username}-acesso_web"
  }

}