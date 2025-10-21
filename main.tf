provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "sctp-ce11-tfstate"
    key    = "yeefei-31-fstate.tfstate"
    region = "us-east-1"
  }
}

# Random string for unique bucket naming
resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
}

# S3 bucket for storing files
resource "aws_s3_bucket" "app_bucket" {
  bucket = "yeefei93-github-actions-app-bucket-${random_string.bucket_suffix.result}"

  tags = {
    Name        = "GitHub Actions App Bucket"
    Environment = "development"
    Project     = "github-actions-lesson-31"
  }
}