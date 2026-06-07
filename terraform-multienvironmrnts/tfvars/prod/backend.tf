terraform {
  backend "s3" {
    bucket       = "tfvars-demo2"
    key          = "remote-state.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}