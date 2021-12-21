# Docker Compose Overview

1. Tool for defining and running multi-container Docker applications
1. Use a YAML file to configure application's services

## Workflow

1. Define app's environment with a Dockerfile
1. Define the services that make up app in docker-compose.yml file
1. Use 'docker compose up' to start up all the services in the app

## Concepts

1. Compose uses a project name to isolate environments from each other
   1. Default project name is the basename of the project directory
   1. OR, use the -p command line option
   1. OR, set the COMPOSE_PROJECT_NAME environment variable
1. Volume preservation
   1. Preserves all volumes used by services
1. Re-use containers as possible
   1. Caches configuration used to create a container and re-uses unless something has changed
1. Variable substitution in the Compose file
   1. Allows for customization to different environments or different users etc.
1. Use service profiles to define services that should be started only if it belongs to a particular profile
1. Control startup order with the depends_on option

## Common Use Cases

1. Quick mock of development environments
1. Creation of automated testing environments
1. Single-host deployments

## Environment variables

1. Default loads .env file in project directory
   1. All variables defined here are available throghout the Docker Compose file
   1. Specify --env-file option to override default behaviour
1. Pass through or set environment variables to containers with the 'environment' key
   1. Can define environment variables directly or use an 'env_file' key that is specific to the container
1. Priority order for environment variables:
   1. Compose file
   1. Shell environment variables
   1. Environment file
   1. Dockerfile
   1. Variable is not defined

## Networking

1. By default, Compose sets up a single network for the app
1. Each container for a service joins the default network and is reachable by other containers as well as discoverable
1. Specify custome networks with the top-level 'networks' key
   1. Can create more complex topologies
   1. Use the 'default' key under top-level 'networks' to configure the default network
      1. Use the 'external' key under 'default' to use a pre-existing network

## Volumes and Bind Mounts

## Compose file reference

1. Three main sections:
   1. Services
      1. Service definitions
         1. Configuration for each container started for the service
         1. Like passing parameters to a 'docker run' statement
   1. Volumes
      1. Analogous to 'docker volume create'
   1. Networks
      1. Analogous to 'docker network create'
