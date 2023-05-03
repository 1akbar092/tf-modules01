terraform {
  backend "s3" {
    bucket = "395524572806"
    region = "us-east-1"
    key    = "jenkins-server/terraform.tfstate"
  }
}