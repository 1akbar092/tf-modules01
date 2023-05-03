######### Lambda Function 
resource "aws_lambda_function" "image_processing_lambda" {
  function_name = "ImageProcessingLambda"
  description   = "Processes images from S3 bucket"
  handler       = "index.handler"
  role          = aws_iam_role.lambda_role.arn
  runtime       = "nodejs14.x"
  memory_size   = 256
  timeout       = 10
  filename      = var.filename

  environment {
    variables = {
      BUCKET_NAME = var.bucket_name
    }
  }
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

