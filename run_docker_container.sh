#!/usr/bin/env bash

containername="ghrb_framework"

docker ps -aq --filter "name=$containername" | grep -q . && docker stop $containername && docker rm $containername
mkdir -p /tmp/elleelleaime/ghrb/
docker run -dt --name $containername -v $(pwd):/root/framework -v /tmp/elleelleaime/ghrb/:/tmp/elleelleaime/ghrb/ ghrb_framework:latest
docker exec $containername $1
