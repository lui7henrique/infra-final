# variáveis de ambiente definidas para uso em diferentes arquivos com nomes auto-explicativos, frequentemente utilizadas em caso de repetição de algum valor específico ou de sigilo de informação

# variável usada especialmente na criação de tags em diferentes arquivos e para o par de chaves
variable "username" {
  default = "nidio"
}

# variável criada para definir a região padrão inequívoca na aws
variable "regiao" {
  default = "ca-central-1"
}

# referente ao id de uma máquina pré-definida de regiões pré-definidas na aws
variable "ami" {
  default = "ami-0abc4c35ba4c005ca"
}

# escolha do modelo de instância ec2 a ser criada. também define por consequência o seu armazenamento
variable "tipoinstancia" {
  default = "t2.micro"
}

# nome da subnet a ser usada na criação da instância ec2
variable "subrede_pub" {
  default = "subnet-09320b92f427c327f"
}

# define o range de ips utilizado para uso do ssh dentro do security group
variable "bloco_vpc" {
  default = "10.0.0.0/16"
}

# define o bloco de endereços que podem ter acesso externo, no caso, nenhuma restrição
variable "bloco_internet" {
  default = "0.0.0.0/0"
}

# define o id padrão da vpc a ser usada no security group
variable "vpc_id" {
  default = "vpc-08f5bcd720d50c4f3"
}