resource "aws_instance" "kubernetes" {
  count                  = 3
  instance_type          = var.tipoinstancia
  ami                    = var.ami
  subnet_id              = var.subrede_pub
  vpc_security_group_ids = ["${aws_security_group.acesso_total_local.id}", "${aws_security_group.acesso_web.id}"]

  tags = {
    "Name" = "kubernetes-${var.username}-${count.index}"
  }
  key_name = aws_key_pair.terraform-chave.key_name

}

resource "aws_instance" "ansibleserver" {
  instance_type          = var.tipoinstancia
  ami                    = var.ami
  subnet_id              = var.subrede_pub
  vpc_security_group_ids = ["${aws_security_group.acesso_total_local.id}", "${aws_security_group.ssh_publico.id}"]

  tags = {
    "Name" = "ansible-${var.username}"
  }
  key_name = aws_key_pair.terraform-chave.key_name

  user_data = <<-EOF
        #!/bin/bash
        sudo apt-get update
        sudo apt-get install software-properties-common -y
        sudo add-apt-repository --yes --update ppa:ansible/ansible -y
        sudo apt-get install ansible -y
    EOF
}



