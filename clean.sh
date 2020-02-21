#!/bin/bash
NAME=krynn-vbmc
docker stop ${NAME}
docker rm ${NAME}
docker rmi ${NAME}
