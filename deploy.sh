#!/bin/bash

cd ../RSL-content || return 1

# Pull the latest changes from the Git repository
git pull

# Stop the existing Docker container named strapi
docker container stop strapi

# Wait for a moment to ensure that Docker has stopped the container
sleep 5

# Remove the existing Docker container named strapi
docker container rm strapi

# Run the NPM production script
npm run production

# Run a Docker container for the Strapi application in detached mode
docker run --detach -p 1337:1337 --name strapi strapi
