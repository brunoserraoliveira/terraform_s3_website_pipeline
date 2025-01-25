terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "tfstate-formacao-devops-bruno-oliveira"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
}