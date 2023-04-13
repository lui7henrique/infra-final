resource "aws_instance" "kubernetes" { # Grupo de recursos de host para gerenciar instancia kubernetes. 
  count                  = 3
  instance_type          = var.tipoinstancia #Tipo de instância a ser usado
  ami                    = var.ami 
  subnet_id              = var.subrede_pub #id subnet vpc 
  vpc_security_group_ids = ["${aws_security_group.acesso_total_local.id}", "${aws_security_group.acesso_web.id}"] #lista de ids security group

  tags = { #tags aplicadas na instancia
    "Name" = "kubernetes-${var.username}-${count.index}"
  }
  key_name = aws_key_pair.terraform-chave.key_name #chave do par de chaves a ser usado para a instância

}

resource "aws_instance" "ansibleserver" { # Grupo de recursos de host para gerenciar instancia ansible. 
  instance_type          = var.tipoinstancia #Tipo de instância a ser usado
  ami                    = var.ami
  subnet_id              = var.subrede_pub
  vpc_security_group_ids = ["${aws_security_group.acesso_total_local.id}", "${aws_security_group.ssh_publico.id}"]

  tags = {
    "Name" = "ansible-${var.username}"
  }
  key_name = aws_key_pair.terraform-chave.key_name

  user_data = <<-EOF #passando user_data
        #!/bin/bash
        sudo apt-get update #atualizar pacote
        sudo apt-get install software-properties-common -y #Instalar propriedades de software
        sudo add-apt-repository --yes --update ppa:ansible/ansible -y #adicionar repositorio ansible
        sudo apt-get install ansible -y #instalar ansible
    EOF
}



