provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "demo-terraform-eks-state-s3-bucket-final-ot"

  lifecycle {
    prevent_destroy = false
  }
}


resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-eks-state-locks-final-ot"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}