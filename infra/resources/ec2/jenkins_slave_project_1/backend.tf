# store the terraform state file in s3
terraform {
  backend "s3" {
    bucket  = "terraform-remote-states"
    key     = "ec2/jenkins_slave_project_1.tfstate"
    region  = "ap-south-1"
    profile = "devops"
  }
}
