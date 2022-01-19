data "aws_iam_policy" "AmazonSageMakerFullAccessPolicy" {
  arn = "arn:aws:iam::aws:policy/AmazonSageMakerFullAccess"
}

data "aws_iam_policy" "AmazonS3FullAccessPolicy" {
  arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role" "SageMakerModelExecutionRole" {
  count = var.endpoint_deploy ? 1 : 0

  name = local.full_name
  managed_policy_arns = [
    data.aws_iam_policy.AmazonSageMakerFullAccessPolicy.arn,
    data.aws_iam_policy.AmazonS3FullAccessPolicy.arn
  ]
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "sagemaker.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_sagemaker_model" "Model" {
  count = var.endpoint_deploy ? 1 : 0

  //name               = format("%s-%s", var.project, var.name)
  execution_role_arn = var.model_execution_role_arn

  primary_container {
    image = var.model_inference_container_image
    mode  = var.model_mode
    model_data_url = var.model_data_url
  }
}

resource "aws_sagemaker_endpoint_configuration" "EndpointConfig" {
  count = var.endpoint_deploy ? 1 : 0

  name = local.full_name

  production_variants {
    variant_name           = "AllTraffic"
    model_name             = aws_sagemaker_model.Model.name
    initial_instance_count = var.endpoint_instance_count
    instance_type          = var.endpoint_instance_type
    initial_variant_weight = var.endpoint_instance_variant_weight
  }

  tags = merge(
    {
      App = "sagemaker"
    },
    local.base_tags,
    var.tags
  )
}

resource "aws_sagemaker_endpoint" "Endpoint" {
  count = var.endpoint_deploy ? 1 : 0

  name                 = local.full_name
  endpoint_config_name = aws_sagemaker_endpoint_configuration.EndpointConfig[0].name

  tags = merge(
    {
      App = "sagemaker"
    },
    local.base_tags,
    var.tags
  )
}
