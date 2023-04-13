resource "aws_eip" "k8s1" { # informacoes de IP elástico
  instance = aws_instance.kubernetes[0].id #instancia associada e id de alocação do VPC EIP
  vpc      = true
}

resource "aws_eip" "k8s2" {
  instance = aws_instance.kubernetes[1].id
  vpc      = true
}
resource "aws_eip" "k8s3" {
  instance = aws_instance.kubernetes[2].id
  vpc      = true
}

resource "aws_eip" "ansible" {
  instance = aws_instance.ansibleserver.id
  vpc      = true
}
