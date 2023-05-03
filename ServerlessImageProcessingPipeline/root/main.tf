module "s3" {
  source      = "../child/S3"
  bucket_name = "92820002827"
}

module "lambda" {
  source      = "../child/Lambda"
  bucket_name = module.s3.bucket_name
  filename = "lambda_function_code.zip"
}

module "api" {
  source     = "../child/ApiGatewayEndpoint"
  lambda_arn = module.lambda.lambda_arn
  region     = data.aws_region.current.name
  account    = data.aws_caller_identity.current.account_id
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}
