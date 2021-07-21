# Docker Fundamentals

## What it is

1. Tooling and platform to manage containers

## Introductory Videos

1. [Video 1](https://www.youtube.com/watch?v=fqMOX6JJhGo&t=1027s)
1. [Video 2](https://www.youtube.com/watch?v=Kyx2PsuwomE)
1. [Video 3](https://www.youtube.com/watch?v=YFl2mCHdv24)

## Concepts

1. Containers have the following properties:
   1. Containers provide a loosely isolated environment
   1. Multiple containers can run on a single host
   1. All containers on a given host share the same kernel
1. Docker = tooling and platform to manage lifecycle of containers
   1. Develop applications using containers
   1. Test and distribute applications
   1. Deploy apps to production as containers or as an orchestrated service
1. Docker Engine components:
   1. Server/daemon process(dockerd)
      1. Listens for Docker API requests
      1. Manages Docker objects
   1. REST API to interface with daemon
   1. CLI client (docker)
      1. Client and daemon need not be on the same machine?
1. Other Concepts
   1. Docker Registry
      1. Stores Docker images
      1. Default is Docker Hub
   1. Docker Objects
      1. Images
         1. Read-only template for creating a Docker container
         1. Can be nested i.e. use other images inside
      1. Containers
         1. Runnable instance of an image
         1. Defined by image + config
         1. Create, start, stop, move, delete containers using CLI
         1. When container is removed => any state changes NOT in persistent storage disappear
         1. Containers only run as long as main process lasts
      1. Networks
         1. Three types: bridge, host, overlay
            1. Bridge networks: default, used when apps run in standalone containers on same machine need to communicate
               1. User-defined bridges should be used where possible
                  1. Provides a clearly scoped network
                  1. Containers can connect/disconnect on the fly
                  1. Containers connected via the same user-defined bridge effectively expose ALL ports to each other
            1. All containers without a --network specified are attached to the default bridge network
               1. Can be a risk
               1. Linked containers on the default bridge share environment variables
               1. The default bridge network is considered a legacy detail of Docker and is not recommended for production use
            1. Host: Remove network isolation between host and container
            1. Overlay: connect multiple Docker daemons together and enable Swarm services to communicate
               1. Best when need Docker containers on multiple hosts to communicate
         1. Port mapping
            1. docker run -p <host-port>:<docker-container-port>
      1. Volumes (and bind mounts)
         1. Docker has two main options for containers to store files in the host machine
            1. Volumes
               1. Stored in the part of the fs managed by Docker (/var/lib/docker/volumes on Linux)
               1. Non-Docker processes should NOT modify this part of the fs
               1. Preferred way to store data
            1. Bind mounts
               1. Can be stored anywhere on the system
               1. Non-Docker processes can modify files here at any time
         1. Volume mapping
            1. Map a directory in host to container
               1. docker run -v <host-dir>:<container-dir>
   1. Dockerfiles
   1. Docker compose
      1. [Reference](https://docs.docker.com/compose/compose-file/)
      1. Compose is a tool for defining and running multi-container Docker applications
      1. The Compose file is a YAML file defining services, networks, and volumes for a Docker application.
      1. You use a YAML file to configure your application’s services
      1. Then, with a single command, you create and start all the services from your configuration
      1. Networks
         1. By default Compose sets up a single network for your app
         1. Each container for a service joins the default network
            1. reachable by other containers on that network, and
            1. discoverable by them at a hostname identical to the container name
         1. app’s network is given a name based on the “project name”, which is based on the name of the directory it lives in

## Simple Workflow

1. Create and test individual containers for each component of your application by first creating Docker images
1. Assemble your containers and supporting infrastructure into a complete application
1. Assemble your containers and supporting infrastructure into a complete application

## Compose Workflow

1. Define your app’s environment with a Dockerfile so it can be reproduced anywhere
1. Define the services that make up your app in docker-compose.yml so they can be run together in an isolated environment
1. Run docker-compose up and Compose starts and runs your entire app

## F.A.Q.

1. Where are Docker images stored?
   1. Depends on underlying OS but this should be treated as irrelevant to the user
1. How do we connect Docker containers to each other?
   1. Utilize a user network for containers on the same system
1. How does a Docker container interact with external file systems
   1. Utilize volumes
1. Do containers run multiple processes?
   1. Although possible, most containers run a single process
   1. Command to be executed when starting container specified with ENTRYPOINT in Dockerfile or RUN command
1. How much of a system's resources can a container take up?
   1. [Reference on resource constraints](https://docs.docker.com/config/containers/resource_constraints/)
   1. By default, can access all system resources
   1. Can be configured to take up a max % of RAM
   1. Memory example: -m 256m (256 MB memory limit) or --memory=256m
   1. Memory swap:
      1. Only relevant if --memory also set
      1. Uses swap when container has exhausted all memory available to it
      1. Difference between --memory-swap and --memory == swap available to container
      1. --memory-swap unset => swap == amount specified in --memory
      1. --memory-swap = -1 => container has unlimited access to swap
1. How do we auto restart containers?
   1. [Reference](https://docs.docker.com/config/containers/start-containers-automatically/)
   1. --restart no/on-failure/always/unless stopped
1. How do we store Docker data on a different volume?
