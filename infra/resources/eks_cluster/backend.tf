# store the terraform state file in s3
terraform {
  backend "s3" {
    bucket  = "terraform-remote-states-178"
    key     = "eks/project_1.tfstate"
    region  = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}