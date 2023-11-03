#!/usr/bin/env bash

containername="ghrb_framework"

docker ps -aq --filter "name=$containername" | grep -q . && docker stop $containername && docker rm $containername
mkdir -p /tmp/elleelleaime/
docker run -dt --name $containername -v $(pwd):/root/framework -v /tmp/elleelleaime/:/tmp/elleelleaime/ ghrb_framework:latest
docker exec $containername $1
