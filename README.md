# Terraform AWS Custom App

This module will create multiple resources when you want to deploy a new app in AWS and you need to use ECS.

It will create:

* Codecommit repository
* S3 bucket
* If you want to use ECS, a Cloudwatch group for your cluster.
* If you want to use ECS, a Fargate cluster with some custom configuration.

## Getting started

Example

````
module "example-app-init" {
  env             = var.env
  project         = local.project_name
  bucket_name     = var.artifacts_bucket
  repository_name = var.codecommit_repository_name
  # ECS
  enable_ecs_cluster        = true
  enable_container_insights = true
  cluster_name              = var.codecommit_repository_name
  default_capacity_provider = "FARGATE_SPOT"
}
````

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.37.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_codecommit_repository.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codecommit_repository) | resource |
| [aws_ecs_cluster.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_cluster_capacity_providers.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster_capacity_providers) | resource |
| [aws_s3_bucket.repo_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.repo_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_iam_policy_document.gitlab_mirroring](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Name of the bucket | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Cluster ECS Name | `string` | n/a | yes |
| <a name="input_default_capacity_provider"></a> [default\_capacity\_provider](#input\_default\_capacity\_provider) | Manages the capacity providers of an ECS Cluster. | `string` | `"FARGATE_SPOT"` | no |
| <a name="input_enable_container_insights"></a> [enable\_container\_insights](#input\_enable\_container\_insights) | Enable container insights | `bool` | `true` | no |
| <a name="input_enable_ecs_cluster"></a> [enable\_ecs\_cluster](#input\_enable\_ecs\_cluster) | Create ECS cluster for deploy app? | `bool` | `false` | no |
| <a name="input_env"></a> [env](#input\_env) | Name of the environment | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Name of the project to deploy | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Id of the region where to deploy | `string` | `"us-east-1"` | no |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | Name of the repository | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
