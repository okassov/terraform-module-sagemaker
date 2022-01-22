variable "environment" {
  type = string
  description = "Environment"
}

variable "project" {
  type = string
  description = "Global Project name"
}

variable "name" {
  type = string
  description = "Project name"
}

variable "tags" {
  description = "A list of tag blocks. Each element should have keys named key, value, etc."
  type        = map(string)
  default     = {}
}


variable "endpoint_deploy" {
  type = bool
  description = "Enable/Disable SageMaker Endpoint deploy"
  default = true
}

variable "model_execution_role_arn" {
  type = string
  description = "SageMaker Model Execution IAM Role ARN"
}

variable "model_inference_container_image" {
  type = string
  description = "SageMaker Model Inference Container Image"
}

variable "model_mode" {
  type = string
  description = "SageMaker Model Execution IAM Role ARN"
  default = "SingleModel"
}

variable "model_data_url" {
  type = string
  description = "SageMaker S3 URL to Model artifact (tar.gz)"
}

variable "endpoint_instance_type" {
  type = string
  description = "SageMaker Endpoint Instance Type"
  default = "ml.m5.large"
}

variable "endpoint_instance_count" {
  type = number
  description = "SageMaker Endpoint Instance Count"
  default = 1
}

variable "endpoint_instance_variant_weight" {
  type = string
  description = "SageMaker Endpoint Instance Count"
  default = null
}

