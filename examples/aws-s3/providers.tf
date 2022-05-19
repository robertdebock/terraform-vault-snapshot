terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "3.6.0"
    }
    aws = {
      source = "hashicorp/aws"
      version = "4.14.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.2.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

provider "random" {
# Configuration options
}

provider "vault" {
  # Configuration options
}
