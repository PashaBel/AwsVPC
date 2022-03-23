provider "aws" {
  access_key = "AKIA6PGSMRXNEXH47GHN"
  secret_key = "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"
  region     = "eu-central-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "dev-private-global-transit-network-terraform-states"

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_acl" "sandbox_acl" {
  bucket = aws_s3_bucket.terraform_state.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "sandbox_versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "sandbox_encryption_configuration" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "dev-private-global-transit-network-terraform-up-and-running-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

