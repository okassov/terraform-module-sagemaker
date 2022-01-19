# Terraform module for AWS SageMaker Deploy

Terraform module developed for automation ML AWS services deploy. ML engineers can easily deploy ML workflow CI/CD. Using this module with Terragrunt will help simplify processes.

## Module Input Variables

- `environment` (**Required**) - Deploy environment name (`default` = null)
- `project` (**Required**) - Deploy project name (`default` = null)
- `name` (**Required**) - Deploy endpoint name (`default` = null)

- `endpoint_deploy` (**Required**) - Enable/Disable endpoint deploy (`default` = true)
- `model_package_name` (**Reqired**) - SageMaker model name (`default` = null)
- `endpoint_instance_type` (Optional) - SageMaker Endpoint instance type. (`default` = "ml.m5.large")"
- `endpoint_instance_count` (Optional) - SageMaker Endpoint instance count. (`default` = 1)
- `endpoint_instance_variant_weight` (Optional) - SageMaker Endpoint variance weight. (`default` = 1)

### Example

```
environment = "dev"
project = "ml"
name = "test"

endpoint_deploy = false
model_package_name = "mlops-qcloudy-test-2022-0-17-21-51-40-55"
endpoint_instance_type = "ml.m5.large"
endpoint_instance_count = 1
```

## Authors

Okassov Marat (marat@qcloudy.io)
