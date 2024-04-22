#!/bin/bash

# Pull the latest changes from the Git repository
git pull

# Stop the existing Docker container named webhooks_server_container
docker container stop webhooks_server_container

# Wait for a moment to ensure that Docker has stopped the container
sleep 5

# Remove the existing Docker container named webhooks_server_container
docker container rm webhooks_server_container

# Run a Docker container for the Webhooks_server application in detached mode
docker run --detach -p 3000:3000 --name webhooks_server_container webhooks_server
