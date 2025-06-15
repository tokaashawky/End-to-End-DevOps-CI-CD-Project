terraform {
  backend "s3" {
    bucket = "myawsbucketgitopsprojectbackend"
    key = "terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true 
  }
}