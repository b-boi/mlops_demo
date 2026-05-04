resource "aws_s3_bucket" "ml_data" {
  bucket = "mlops-demo-logs-${random_id.rand.hex}"
}

resource "random_id" "rand" {
  byte_length = 4
}

#Export logs to S3
resource "aws_cloudwatch_log_subscription_filter" "to_s3" {
  name            = "log-to-s3"
  log_group_name  = aws_cloudwatch_log_group.app_logs.name
  filter_pattern  = ""
  destination_arn = aws_kinesis_firehose_delivery_stream.logs.arn
}

resource "aws_kinesis_firehose_delivery_stream" "logs" {
  name        = "log-stream"
  destination = "extended_s3"

  extended_s3_configuration {
    bucket_arn = aws_s3_bucket.ml_data.arn
    role_arn   = aws_iam_role.firehose_role.arn
  }
}