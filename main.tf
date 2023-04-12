resource "aws_codecommit_repository" "this" {
  repository_name = var.repository_name
  description     = "Git repo for project ${var.repository_name}"
}

resource "aws_s3_bucket" "repo_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_acl" "repo_bucket" {
  bucket = aws_s3_bucket.repo_bucket.id
  acl    = "private"
}

resource "aws_cloudwatch_log_group" "this" {
  count = var.enable_ecs_cluster == true ? 1 : 0
  name  = "${var.cluster_name}-cluster"
}

resource "aws_ecs_cluster" "main" {
  count = var.enable_ecs_cluster == true ? 1 : 0
  name  = var.cluster_name

  configuration {
    execute_command_configuration {
      logging = "OVERRIDE"

      log_configuration {
        cloud_watch_encryption_enabled = true
        cloud_watch_log_group_name     = aws_cloudwatch_log_group.this[0].name
      }
    }
  }

  setting {
    name  = "containerInsights"
    value = var.enable_container_insights == true ? "enabled" : "disabled"
  }
}

resource "aws_ecs_cluster_capacity_providers" "this" {
  count        = var.enable_ecs_cluster == true ? 1 : 0
  cluster_name = aws_ecs_cluster.main[0].name

  capacity_providers = ["FARGATE", "FARGATE_SPOT"]

  default_capacity_provider_strategy {
    base              = 1
    capacity_provider = var.default_capacity_provider
  }
}