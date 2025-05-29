terraform {
  backend "s3" {
    bucket         = "state-bucket-tokaaaaaaaaaaaa"
    key            = "state-file/tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile = true
  }
}

