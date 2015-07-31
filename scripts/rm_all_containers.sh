#!/bin/sh

# remove last container
#docker rm -f $(docker ps -lq)
docker rm -f $(docker ps -aq)

# remove notag none images
#docker rmi -f $(docker images | grep none | awk '{print $3}')


