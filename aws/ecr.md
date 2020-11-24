# AWS ECR Overview

## What it is

Managed container registry service that integrates well with:

1. EC2
1. ECS (Elastic Container Service)
1. EKS (Elastic Kubernetes Service)
1. Github

Supports private container repositories with resource-based permissions using IAM

## Concepts

1. Registry
   1. A collection of repositories
1. Repositories
   1. A repository is intended to hold a collection of images that are all versions of a particular app

## Registry Authentication

Docker CLI does NOT support IAM authentication methods.
To pull/push images from/to ECR using Docker CLI, do one of the following:

1. Use the AWS ECR credential helper
1. Use an authorization token
