# Dockerfile overview

[Reference](https://docs.docker.com/engine/reference/builder/)

## Concepts

1. docker build builds an image from a Dockerfile and a context
   1. Context = files at specified PATH or URL (e.g. git repo location)
      1. Contexts are processed recursively
   1. Build is run by the Docker daemon
   1. Use .dockerignore files to improve build performance
   1. Traditionally, the dockerfile is called Dockerfile and located in the root of the context
1. Dockerfile defines steps to create and run an image
   1. Each instruction corresponds to a layer in the image
   1. The Docker daemon runs the instructions in the Dockerfile one-by-one, committing the result of each instruction to a new image if necessary
   1. Changes to Dockerfile => Only changed layers are rebuilt
1. Dockerfile format

   ```
   Base format
   Comment
   INSTRUCTION arguments
   ```

   1. Parser directives
      1. Optional, impact way in which subsequent lines are parsed
         1. #directive = value
      1. Must appear before all comments, empty lines and build instructions
         1. ie at the very top of Dockerfile
      1. Two types:
         1. syntax
            1. #syntax=[remote image reference]
            1. Enabled for Buildkit only
         1. escape
            1. #escape=\ (backslash)
            1. Sets the character used to escape characters in Dockerfile
   1. Environment variables
      1. ENV <variable-name> <variable-value>
      1. ENV <key> <value>
      1. Can be referred to using ${variable-name} OR $variable-name
