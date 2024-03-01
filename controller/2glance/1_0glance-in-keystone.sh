#https://www.server-world.info/en/note?os=Ubuntu_22.04&p=openstack_antelope&f=5
openstack user create --domain default --project service --password servicepassword glance
openstack role add --project service --user glance admin
openstack service create --name glance --description "OpenStack Image service" image
export controller=192.168.1.11
openstack endpoint create --region RegionOne image public http://$controller:9292
openstack endpoint create --region RegionOne image internal http://$controller:9292
openstack endpoint create --region RegionOne image admin http://$controller:9292
mysql

apt -y install glance
#mv /etc/glance/glance-api.conf /etc/glance/glance-api.conf.org
echo -e " \n configuring glance-api.conf \n"
read -n 1 -r
cp glance-api-conf /etc/glance/glance.-api.conf

echo -e "\n ensuring ownership \n"
chmod 640 /etc/glance/glance-api.conf
chown root:glance /etc/glance/glance-api.conf
su -s /bin/bash glance -c "glance-manage db_sync"
systemctl restart glance-api
systemctl enable glance-api
nginx.conf >> /etc/nginx/nginx.conf
systemctl restart nginx