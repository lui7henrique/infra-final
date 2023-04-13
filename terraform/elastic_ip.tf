resource "aws_eip" "k8s1" {
  instance = aws_instance.kubernetes[0].id
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
