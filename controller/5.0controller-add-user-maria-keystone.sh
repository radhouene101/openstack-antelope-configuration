mysql
apt -y install keystone python3-openstackclient apache2 libapache2-mod-wsgi-py3 python3-oauth2client
echo -e "\n adding keystone conf in keystone.conf put the conf in the script directory \n"
cat keystone_conf-1.sh
echo -e "\n press any key to continue"
read -n 1 -r
nano  /etc/keystone/keystone.conf

echo -e "\n populating database \n"
su -s /bin/bash keystone -c "keystone-manage db_sync"
keystone-manage fernet_setup --keystone-user keystone --keystone-group keystone
keystone-manage credential_setup --keystone-user keystone --keystone-group keystone
export controller=dlp.srv.world
keystone-manage bootstrap --bootstrap-password adminpassword \
--bootstrap-admin-url https://$controller:5000/v3/ \
--bootstrap-internal-url https://$controller:5000/v3/ \
--bootstrap-public-url https://$controller:5000/v3/ \
--bootstrap-region-id RegionOne