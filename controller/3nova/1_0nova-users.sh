#https://www.server-world.info/en/note?os=Ubuntu_22.04&p=openstack_antelope&f=7
echo -e "\n adding nova user to the project \n "
echo -e " \n openstack user create --domain default --project service --password servicepassword nova \n "
openstack user create --domain default --project service --password servicepassword nova
echo -e " \n openstack role add --project service --user nova admin \n "
openstack role add --project service --user nova admin
echo -e " \n openstack user create --domain default --project service --password servicepassword placement \n "
openstack user create --domain default --project service --password servicepassword placement
openstack role add --project service --user placement admin
echo -e "\n openstack service create --name nova --description "OpenStack Compute service" compute \n"
openstack service create --name nova --description "OpenStack Compute service" compute
# create service entry for [placement]
echo -e "# create service entry for [placement]"
openstack service create --name placement --description "OpenStack Compute Placement service" placement
echo -e "export controller=192.168.1.11"
export controller=192.168.1.11
echo -e "# create endpoint for [nova] (public)"
openstack endpoint create --region RegionOne compute public http://$controller:8774/v2.1/%\(tenant_id\)s
openstack endpoint create --region RegionOne compute internal http://$controller:8774/v2.1/%\(tenant_id\)s
openstack endpoint create --region RegionOne compute admin http://$controller:8774/v2.1/%\(tenant_id\)s
echo -e " \n \n \n # create endpoint for [placement] (public) \n "
openstack endpoint create --region RegionOne placement public http://$controller:8778
openstack endpoint create --region RegionOne placement internal http://$controller:8778
openstack endpoint create --region RegionOne placement admin http://$controller:8778

echo -e "\n Add a User and Database on MariaDB for Nova. \n please refer to 1_01nova-mysql file \n "
read -n 1 -r
mysql

