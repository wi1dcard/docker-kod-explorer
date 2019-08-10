# Docker Image(s) for [KodExplorer](https://github.com/kalcaddle/KodExplorer)

Uses latest KodExplorer in the master branch, provides decoupled Nginx and PHP-FPM, and work with `docker-compose` instead of fighting against CLI options.

## Usage

Create and start containers:

```bash
$ docker-compose up
```

Then open <http://localhost:4000/> in your browser. You will see the welcome page of KodExplorer.

Get information about the data volume:

```bash
$ docker volume inspect my-kod-explorer-data
```

Retrieve data from container to host:

```bash
$ docker container create --name dummy -v my-kod-explorer-data:/data hello-world
$ docker cp dummy:/data ./data
$ docker rm dummy
```

Delete all resources (except volumes):

```bash
$ docker-compose down
```

Or delete all resources include volumes which will CLEANUP ALL YOUR DATA:

```bash
$ docker-compose down -v
```

## Why

Before I started, I've searched in GitHub. Found similar repos like:

- [yangxuan8282/docker-image](https://github.com/yangxuan8282/docker-image/tree/master/kodexplorer)
- [itzg/docker-kodexplorer](https://github.com/itzg/docker-kodexplorer)
- [xaljer/docker-kodexplorer](https://github.com/xaljer/docker-kodexplorer)

However, all these images do not meet my requirements. While I would like to deploy KodExplorer into my Kubernetes cluster, I need a Docker image that:

1. Contains the latest version of KodExplorer.
2. Serves using PHP-FPM, not `php -S`.
3. Separated PHP-FPM and Nginx (2 standalone images).
4. Prune and small.

So I created this repo. Hope you enjoy it!
