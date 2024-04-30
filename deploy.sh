#!/bin/bash

# Pull the latest changes from the Git repository
git pull

# Stop the existing Docker container named webhooks_server_container
docker container stop webhooks_server_container

docker rmi webhooks_server

docker build -t webhooks_server

# Run a Docker container for the Webhooks_server application in detached mode
docker run --detach -p 3000:3000 --name webhooks_server_container webhooks_server
