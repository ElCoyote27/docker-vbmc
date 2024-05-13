#!/bin/sh

IMAGE_NAME=krynn-vbmc
docker build -t ${IMAGE_NAME} . \
--add-host=gitlab.lasthome.solace.krynn:10.0.129.186 \
--add-host=ca8.lasthome.solace.krynn:10.0.130.186
