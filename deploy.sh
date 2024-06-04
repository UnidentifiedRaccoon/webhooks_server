#!/bin/bash

# Pull the latest changes from the Git repository
git pull

kill $(lsof -t -i:3010)

nohup node server.js &
