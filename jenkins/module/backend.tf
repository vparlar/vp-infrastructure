terraform {
backend "s3" {
bucket = "acirrustech-iaac"
key = "environments/jenkins/us-east-1/tools/tools/jenkins.tfstate"
region = "us-east-1"
  }
}
