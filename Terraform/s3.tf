resource "aws_s3_bucket" "ml_data" {
  bucket = "mlops-demo-logs-${random_id.rand.hex}"
}

resource "random_id" "rand" {
  byte_length = 4
}