// Aqui temos o par de chaves que o terraform usará para se autenticar na aws.
// Pode usadas chaves locais ou as chaves diretamente da aws (AMI por exemplo).
resource "aws_key_pair" "terraform-chave" {
  key_name   = "${var.username}-terraform-aws"
  public_key = file("~/.ssh/terraform-aws.pub")
}