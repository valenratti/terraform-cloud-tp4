# ---------------------------------------------------------------------------
# AWS Lambda resources
# ---------------------------------------------------------------------------

# Lambda
# resource "aws_lambda_permission" "apigw_lambda" {
#   provider = aws.aws

#   statement_id  = "AllowExecutionFromAPIGateway"
#   action        = "lambda:InvokeFunction"
#   function_name = aws_lambda_function.this.function_name
#   principal     = "apigateway.amazonaws.com"

#   source_arn = "arn:aws:execute-api:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:${aws_api_gateway_rest_api.this.id}/*/${aws_api_gateway_method.this.http_method}${aws_api_gateway_resource.this.path}"
# }

# resource "aws_lambda_function" "this" {
#   provider = aws.aws

#   filename      = "${local.path}/lambda/lambda.zip"
#   function_name = "AWSLambdaHandler-${replace(local.bucket_name, "-", "")}"
#   role          = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/LabRole"
#   handler       = "lambda_handler.main"
#   runtime       = "python3.9"
# }

resource "aws_lambda_function" "dynamodb_lambda" {
  provider = aws.aws

  filename      = "${local.path}/lambda/lambda.zip"
  function_name = "AWSLambdaHandler-test-attach-vpc"
  role          = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/LabRole"
  handler       = "lambda_handler.main"
  runtime       = "python3.9"

  vpc_config {
    subnet_ids         = [module.lambda_vpc.private_subnet_id]
    security_group_ids = [module.lambda_vpc.default_security_group_id]
  }
}