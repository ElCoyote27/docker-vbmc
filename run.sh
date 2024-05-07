#!/bin/sh
NAME=krynn-vbmc
export DOCKER_ID="$(docker ps -aq --filter name=${NAME})"

if [[ "${DOCKER_ID}" != "" ]]; then
	docker start ${NAME}
else
	docker run \
	-d --privileged \
	--restart=always \
	--network=host \
	-v /var/run/libvirt:/var/run/libvirt \
	-v /etc/virtualbmc:/etc/virtualbmc \
	-v /var/log/virtualbmc:/var/log/virtualbmc \
	-v /root/.vbmc:/root/.vbmc \
	--name ${NAME} \
	krynn-vbmc:latest
fi

