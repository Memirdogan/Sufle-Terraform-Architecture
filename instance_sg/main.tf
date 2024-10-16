terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

data "terraform_remote_state" "out_vpc" {
  backend = "local"
  config = {
    path = "/home/emir/Masaüstü/app/terraform/Sufle_Terraform/vpc/terraform.tfstate"
  }
}

data "terraform_remote_state" "key_pair" {
  backend = "local"
  config = {
    path = "/home/emir/Masaüstü/app/terraform/Sufle_Terraform/keypair/terraform.tfstate"
  }
}