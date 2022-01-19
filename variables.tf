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

variable "model_package_name" {
  type = string
  description = "SageMaker Model Package Name"
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

