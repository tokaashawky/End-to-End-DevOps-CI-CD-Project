terraform {
  backend "s3" {
    bucket = "myawsbucketgitopsprojectbackend"
    key    = "devops-project/terraform.tfstate"
    region = "us-east-1"
  }
}