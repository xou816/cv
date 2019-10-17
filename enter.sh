#!/bin/sh
docker build --network=host -t cvbuilder .
docker run --rm -it -e THEUID=`id -u $USER` -v $PWD:/var/doxerlive cvbuilder ash
