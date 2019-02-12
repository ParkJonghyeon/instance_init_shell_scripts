#!/bin/bash
docker pull larkjh/tbselcrawler:0.7
docker pull ubuntu:16.04

docker run -it --name onionlinkset-volume -v /home/ubuntu/shared_dir:/home/tordocker/shared_dir ubuntu:16.04
docker run \
--volume=/:/rootfs:ro \
--volume=/var/run:/var/run:rw \
--volume=/sys:/sys:ro \
--volume=/var/lib/docker/:/var/lib/docker:ro \
--publish=8080:8080 \
--detach=true \
--name=cadvisor \
google/cadvisor:latest

#host의 포트:컨테이너의 포트
