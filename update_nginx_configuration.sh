#!/bin/bash

echo "Finding the nginx container"
running_nginx_containers=$(docker ps | grep nginx | awk '{print $1}')

for i in $running_nginx_containers
  do
    echo "Copy new config to $i"
    docker cp nginx/default.conf $i:/etc/nginx/conf.d/default.conf; sleep 1
    echo "Copy reload nginx in $i"
    docker exec -it $i nginx -s reload
    echo "Update Finished on $running_nginx_containers"
  done

# If more than 1 container, we need to declare Array and not variable