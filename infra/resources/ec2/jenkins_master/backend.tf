# store the terraform state file in s3
terraform {
  backend "s3" {
    bucket  = "terraform-remote-states-178"
    key     = "ec2/jenkins_master.tfstate"
    region  = "ap-south-1"
    profile = "devops"
  }
}
