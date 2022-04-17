provider "aws" {
  region = "us-east-1"
}

terraform {
    backend "s3" {
        # Bucket Config
        bucket = "alex-terraform-state-101"
        key    = "global/s3/terraform.tfstate"
        region = "us-east-1"

        # DynamoDB Config
        dynamodb_table = "alex-terraform-locks-101"
        encrypt        = true
    }
}