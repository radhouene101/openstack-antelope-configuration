#https://www.server-world.info/en/note?os=Ubuntu_22.04&p=mariadb
apt -y install mariadb-server
echo -e "next is vi /etc/mysql/mariadb.conf.d/50-server.cnf\n"
echo -e "in this step : \n# line 90 : confirm default charset\n# if use 4 bytes UTF-8, specify [utf8mb4]\ncharacter-set-server  = utf8mb4\ncollation-server      = utf8mb4_general_ci\n"
sleep 2
echo -e "press any key to continuer\n"
read -n 1 -r

nano /etc/mysql/mariadb.conf.d/50-server.cnf
systemctl restart mariadb
echo -e "now we will use -> mysql_secure_installation  command\n"
sleep 5
mysql_secure_installation
echo -e "you-re back\n"
mysql
echo " #finished--radhouene" >> ~/OPENSTACK-ANTELOPE-CONF/controller/2mariadb-install-and-set-up.sh
echo "test ahmed"