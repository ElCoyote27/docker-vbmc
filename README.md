docker exec -ti \
	vbmc_daltigoth vbmc add \
	--username admin --password password --port 6231 \
	--address 192.168.122.1 \
	--libvirt-uri qemu:///system  overcloud-ceph-0

docker ps -q --filter name=vbmc_daltigoth

docker exec -ti vbmc_daltigoth vbmc list
