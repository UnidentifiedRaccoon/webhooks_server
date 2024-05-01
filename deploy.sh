#!/bin/bash

# Pull the latest changes from the Git repository
git pull

nohup node server.js &
