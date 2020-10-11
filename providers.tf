provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "rdemo-tf"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "rdemodb.tf"
  }
}
