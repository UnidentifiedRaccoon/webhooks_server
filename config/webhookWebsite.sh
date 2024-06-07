#!/bin/bash

cd ../RSL-website || return 1

# Pull the latest changes from the Git repository
git pull

# Stop and Remove the existing Docker container named strapi
#(docker container stop website && docker container rm website) || echo "No resource found to remove"
(docker container stop nginx-react-container && docker container rm nginx-react-container) || echo "No resource found to remove"

#docker rmi myreactapp || echo "No resource found to remove"
docker rmi nginx-react-image || echo "No resource found to remove"

#docker build -t myreactapp .
docker build -t nginx-react-image .

#docker run --detach -p 3000:3000 --name website myreactapp
docker run -d -p 80:80 --name nginx-react-container nginx-react-image
