terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

data "terraform_remote_state" "out_vpc" {
  backend = "local"
  config = {
    path = "/home/emir/Masaüstü/app/terraform/Sufle_Terraform/vpc/terraform.tfstate"
  }
}