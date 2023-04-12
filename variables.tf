#########################################
### Provider - Environment variables
#########################################

variable "region" {
  default     = "us-east-1"
  type        = string
  description = "Id of the region where to deploy"
}

#########################################
### VPC variables
#########################################

variable "project" {
  type        = string
  description = "Name of the project to deploy"
}

variable "env" {
  type        = string
  description = "Name of the environment"
}

variable "bucket_name" {
  type        = string
  description = "Name of the bucket"
}

variable "repository_name" {
  type        = string
  description = "Name of the repository"
}

variable "cluster_name" {
  type        = string
  description = "Cluster ECS Name"
}

variable "enable_ecs_cluster" {
  type        = bool
  description = "Create ECS cluster for deploy app?"
  default     = false
}

variable "enable_container_insights" {
  type        = bool
  description = "Enable container insights"
  default     = true
}

variable "default_capacity_provider" {
  type        = string
  description = "Manages the capacity providers of an ECS Cluster."
  default     = "FARGATE_SPOT"
}