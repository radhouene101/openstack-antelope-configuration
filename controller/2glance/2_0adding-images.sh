#https://www.server-world.info/en/note?os=Ubuntu_22.04&p=openstack_antelope&f=6
wget http://cloud-images.ubuntu.com/releases/22.04/release/ubuntu-22.04-server-cloudimg-amd64.img
modprobe nbd
qemu-nbd --connect=/dev/nbd0 ubuntu-22.04-server-cloudimg-amd64.img
echo -e "\n ---at this case u will be mounting it temporarly ------- \n -----at this point please open documentation at https://www.server-world.info/en/note?os=Ubuntu_22.04&p=openstack_antelope&f=6 ------ \n "
#mount /dev/nbd0p1 /mnt