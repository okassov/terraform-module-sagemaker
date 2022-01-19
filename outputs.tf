output "model_endpoint_arn" {
    value = length(aws_sagemaker_endpoint.Endpoint) > 0 ? aws_sagemaker_endpoint.Endpoint[0].arn : null
}

output "model_endpoint_name" {
    value = length(aws_sagemaker_endpoint.Endpoint) > 0 ? aws_sagemaker_endpoint.Endpoint[0].name : null
}