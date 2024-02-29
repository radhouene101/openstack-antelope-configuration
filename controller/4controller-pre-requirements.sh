## execute  all therse comannds as root
apt -y install software-properties-common
add-apt-repository cloud-archive:antelope
apt update
apt upgrade -y
apt -y install rabbitmq-server memcached python3-pymysql nginx libnginx-mod-stream
echo -e "adding user RabbitMQ\n"
rabbitmqctl add_user openstack password
echo -e "setting permission for rabbitmctl\n"
rabbitmqctl set_permissions openstack ".*" ".*" ".*"
echo -e "now we :  vi /etc/mysql/mariadb.conf.d/50-server.cnf\n"
echo -e "# line 27 : change to the IP address mariadb listens \n if listen all, specify [0.0.0.0] \n add your adress here :: bind-address = 10.0.0.30 \n # line 40 : uncomment and change \n # default value 151 is not enough on Openstack Env \n max_connections = 500 \n"
echo -e "press any key to continue \n"
read -n 1 -r
nano /etc/mysql/mariadb.conf.d/50-server.cnf
echo -e "\n"
echo -e "\n then we will change /etc/memcached.conf\n"
echo -e "# line 35 : change to the IP address memcached listens \n if listen all, specify [0.0.0.0] \n -l 10.0.0.30 \n"
unlink /etc/nginx/sites-enabled/default
systemctl restart mariadb rabbitmq-server memcached nginx