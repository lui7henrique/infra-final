resource "aws_key_pair" "terraform-chave" {
  key_name   = "${var.username}-terraform-aws"
  public_key = file("~/.ssh/terraform-aws.pub")
}