# cada bloco "resource" define a criação de um security group incluindo o destino dos seus usos e suas especificações, de acordo com o uso pretendido da instância que será gerada contendo o security group
# abaixo temos a definição de 3 sg's para, respectivamente:
## permitir o uso de ssh na instância
## permitir a conexão externa via ssh
## liberar o acesso da instância à internet via protocolo tcp
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