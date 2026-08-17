# backend.tf file
# This file configures the Terraform backend for storing state
# store the terraform state file in s3

terraform {
  backend "s3" {
    bucket  = "terraform-remote-states-178"
    key     = "projects/network/network.tfstate"
    region  = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}