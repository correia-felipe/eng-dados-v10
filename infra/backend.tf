terraform {
  backend "s3" {
    bucket         = "artifactory-847623453769"
    key            = "backend-tf/eng-dados-v10/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
