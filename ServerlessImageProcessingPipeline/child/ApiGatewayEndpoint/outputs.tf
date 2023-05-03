output "api_gateway_endpoint" {
  value = "https://${aws_api_gateway_rest_api.image_processing_api.id}.execute-api.${data.aws_region.current.name}.amazonaws.com/${aws_api_gateway_rest_api.image_processing_api.root_resource_id}"
}
