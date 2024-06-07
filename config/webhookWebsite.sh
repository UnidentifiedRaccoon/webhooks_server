#!/bin/bash

cd ../RSL-website || return 1

# Pull the latest changes from the Git repository
git pull

# Stop and Remove the existing Docker container named strapi
(docker container stop nginx-react-container && docker container rm nginx-react-container) || echo "No resource found to remove"

docker rmi nginx-react-image || echo "No resource found to remove"

docker build -t nginx-react-image .

docker run -d -p 80:80 --name nginx-react-container nginx-react-image
