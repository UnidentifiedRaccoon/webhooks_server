#!/bin/bash

cd ../rsl-learning-platform/docker || return 1

# Pull the latest changes from the Git repository
git pull

docker-compose -p web-service down || echo "No resource found to remove"

docker rmi rsl-learning-platform
docker rmi eclipse-temurin:21.0.2_13-jdk-jammy
docker rmi eclipse-temurin:21.0.2_13-jre-jammy

cd java_images/21/jdk/ubuntu/jammy || return 1
docker build -t eclipse-temurin:21.0.2_13-jdk-jammy .

cd ../../../jre/ubuntu/jammy || return 1
docker build -t eclipse-temurin:21.0.2_13-jre-jammy .

cd ../../../../../

docker-compose -p web-service up -d
