# Redis with Docker

[Docker Hub Link](https://hub.docker.com/_/redis)

## Using docker-compose

Use the following docker-compose YAML file as a guide

```yaml
version: "3.7"
services:
  db:
    image: redis

    # Use a config file
    # command: ["redis-server", "/data/confs/redis.conf"]
    # command: redis-server --appendonly yes --appendfsync everysec --save 900 1 --save 300 10 --save 60 10000 --rdbcompression yes --rdbchecksum yes --dbfilename dump.rdb --dir /data
    command:
      [
        "redis-server",

        "--appendonly",
        "yes",
        "--appendfsync",
        "everysec",

        "--save",
        "15",
        "1",
        "--save",
        "900",
        "1",
        "--save",
        "300",
        "10",
        "--save",
        "60",
        "10000",
        "--rdbcompression",
        "yes",
        "--rdbchecksum",
        "yes",
        "--dbfilename",
        "dump.rdb",
        "--dir",
        "/data",
      ]

    restart: always

    ports:
      - "6379:6379"

    volumes:
      - type: volume
        source: data
        target: /data

      # - "data:/data"

      # Use a config file
      # - type: bind
      #   source: ./confs
      #   target: /data/confs

      # - "./confs:/data/confs"

volumes:
  data:
```

```shell
docker-compose up -d
```

Login with:

```shell
docker exec -it redis_db_1 /bin/bash
```
