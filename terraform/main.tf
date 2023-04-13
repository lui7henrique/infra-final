// Aqui no primeiro bloco temos o provedor cloud e a versão que o terraform vai utilizar.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

// Aqui temos a região a ser usada dentro da aws.
provider "aws" {
  region = var.regiao
}