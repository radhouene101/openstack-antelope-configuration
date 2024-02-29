#https://www.server-world.info/en/note?os=Ubuntu_22.04&p=openstack_antelope&f=4
chmod 600 ~/keystonerc
cp /OPENSTACK-ANTELOPE-CONF/1KEYSTONE/keytonerc .
source ~/keystonerc
openstack project create --domain default --description "Service Project" service
openstack project list