#https://www.server-world.info/en/note?os=Ubuntu_22.04&p=mariadb


show grants for root@localhost; 
select user,host,password from mysql.user; 
show databases;
create database test_database; 
create table test_database.test_table (id int, name varchar(50), address varchar(50), primary key (id)); 
insert into test_database.test_table(id, name, address) values("001", "Ubuntu", "Hiroshima"); 
select * from test_database.test_table; 
drop database test_database; 
exit