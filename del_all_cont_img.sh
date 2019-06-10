#!/usr/bin/env bash

#Stop all containers
docker kill $(docker ps -q)
# Delete all containers
docker rm $(docker ps -a -q) -f
# Delete all images
docker rmi $(docker images -q) -f

# Kubernetes
eval $(minikube docker-env)

#Stop all containers
docker kill $(docker ps -q)
# Delete all containers
docker rm $(docker ps -a -q) -f
# Delete all images
docker rmi $(docker images -q) -f