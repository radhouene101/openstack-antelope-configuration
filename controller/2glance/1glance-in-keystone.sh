openstack user create --domain default --project service --password servicepassword glance
openstack role add --project service --user glance admin
openstack service create --name glance --description "OpenStack Image service" image
export controller=192.168.1.11
openstack endpoint create --region RegionOne image public https://$controller:9292
openstack endpoint create --region RegionOne image internal https://$controller:9292
openstack endpoint create --region RegionOne image admin https://$controller:9292
mysql