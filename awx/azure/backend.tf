terraform {
backend "s3" {
bucket = "acirrustech-iaac"
key = "azure/us-east-1/tools/tools/azure.tfstate"
region = "us-east-1"
  }
}
