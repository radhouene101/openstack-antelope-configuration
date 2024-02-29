# line 444 : add to specify Memcache Server
memcache_servers = 192.168.1.11:11211
# line 661 : change to MariaDB connection info
connection = mysql+pymysql://keystone:password@192.168.1.11/keystone
# line 2639 : uncomment
provider = fernet