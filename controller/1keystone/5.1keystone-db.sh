create database keystone; 
grant all privileges on keystone.* to keystone@'localhost' identified by 'password'; 
grant all privileges on keystone.* to keystone@'%' identified by 'password'; 
flush privileges; 
exit