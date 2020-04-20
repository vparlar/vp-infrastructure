terraform {
backend "s3" {
bucket = "acirrustech-iaac"
key = "prometheus/us-east-1/prometheus/dev/prometheus.tfstate"
region = "us-east-1"
  }
}
