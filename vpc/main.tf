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

data "terraform_remote_state" "instance_sg" {
  backend = "local"
  config = {
    path = "../instance_sg/terraform.tfstate"
  }
}