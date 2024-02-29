#https://www.server-world.info/en/note?os=Ubuntu_22.04&p=ntp&f=3
 apt -y install chrony
 echo -e " next command is vi /etc/chrony/chrony.conf"
 echo -e "# line 20 : comment out default settings and add NTP Servers for your timezone\n #pool ntp.ubuntu.com        iburst maxsources 4\n#pool 0.ubuntu.pool.ntp.org iburst maxsources 1\n#pool 1.ubuntu.pool.ntp.org iburst maxsources 1\n#pool 2.ubuntu.pool.ntp.org iburst maxsources 2\npool ntp.nict.jp iburst"
 sleep 30
 echo -e "# add to the end : add network range you allow to receive time syncing requests from clients
\nallow 10.0.0.0/24"
echo "allow 10.0.0.0/24" >> /etc/chrony/chrony.conf
echo "press anything to continue"
read -n 1 -r
nano /etc/chrony/chrony.conf
systemctl restart chrony
echo -e "verify status\n"
# verify status
chronyc sources
echo "#finished--radhouene" >> ~/OPENSTACK-ANTELOPE-CONF/controller/1controller1-NTP-chrony.sh