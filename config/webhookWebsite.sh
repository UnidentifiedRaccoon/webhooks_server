#!/bin/bash

cd ../RSL-website || return 1

# Pull the latest changes from the Git repository
git pull

# Stop and Remove the existing Docker container named strapi
(docker container stop website && docker container rm website) || echo "No resource found to remove"

docker rmi myreactapp || echo "No resource found to remove"

docker build -t myreactapp .

docker run --detach -p 3000:3000 --name website myreactapp
