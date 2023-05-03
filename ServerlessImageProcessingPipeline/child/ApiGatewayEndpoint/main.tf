######## API Gateway endpoint
resource "aws_api_gateway_rest_api" "image_processing_api" {
  name = "image_processing_api"
}

resource "aws_api_gateway_resource" "api_gateway_resource" {
  rest_api_id = aws_api_gateway_rest_api.image_processing_api.id
  parent_id   = aws_api_gateway_rest_api.image_processing_api.root_resource_id
  path_part   = "image"
}

resource "aws_api_gateway_method" "post_method" {
  rest_api_id   = aws_api_gateway_rest_api.image_processing_api.id
  resource_id   = aws_api_gateway_resource.api_gateway_resource.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_lambda_permission" "api_gateway_invoke" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_arn
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:${var.region}:${var.account}:${aws_api_gateway_rest_api.image_processing_api.id}/*/POST/image"
}

data "aws_region" "current" {}