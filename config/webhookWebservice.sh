#!/bin/bash

cd ../rsl-learning-platform/docker || return 1

# Pull the latest changes from the Git repository
git pull

docker-compose -p web-service down || echo "No resource found to remove"

docker rmi rsl-learning-platform

docker-compose -p web-service up -d
