resource "aws_s3_bucket" "terraform_state" {
  bucket = "alex-terraform-state-101"

  force_destroy = true
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
    bucket = aws_s3_bucket.terraform_state.id

    versioning_configuration {
      status = "Enabled"
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption" {
    bucket = aws_s3_bucket.terraform_state.id

    rule {
        apply_server_side_encryption_by_default {
          #kms_master_key_id = aws_kms_key.mykey.arn
          sse_algorithm     = "AES256"
        }
    } 
}
