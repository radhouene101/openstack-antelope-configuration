
echo -e " \n  adding the ubuntu image to glance \n "
openstack image create "Ubuntu2204" --file ubuntu-22.04-server-cloudimg-amd64.img --disk-format qcow2 --container-format bare --public
echo -e "\n listing images \n "
openstack image list