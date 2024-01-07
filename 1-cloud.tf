terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
 # backend est le stockage désigné pour notre instance dans la région Europe de l'est 3
  backend "s3" {
    bucket = "tpbucketflo"
    key    = "tfstate/tpbucketflo.tfstate"
    region = "eu-west-3"
  }
}