# AWS ECS Overview

## What it is

Container management service that makes it easy to run, stop and manage containers on a cluster

1. Containers are defined in a task definition
1. Tasks can be part of a service
1. A service is a configuration that runs and maintains a specified number of tasks in a cluster
1. Tasks and services can be run serverless on AWS Fargate or on a cluster of EC2 intances managed by the user

## Concepts

1. Task definitions
   1. JSON text file that describes 1-10 containers that form application
1. Tasks
   1. A task is the instantiation of a task definition within a cluster
   1. After creating a task definition, user can specify the number of tasks to run on cluster
1. Task scheduler
   1. Responsible for placing tasks within cluster
   1. e.g. can define a service that runs and maintains a specified number of tasks simultaneously
1. Cluster
   1. Logical grouping of tasks or services
   1. Register one or more EC2 instances with a cluster to run tasks on them
1. Container agent
   1. Runs on each container instance within a cluster
   1. Sends information about the resource's current running tasks and resource utilization to ECS
   1. Starts and stops tasks whenever it receives a request from ECS

## Clusters
