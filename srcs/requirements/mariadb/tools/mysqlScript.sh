#!/bin/bash

service mysql start;


sleep 5

mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -h localhost -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -h localhost -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"

mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -h localhost -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
#MODIFY PSWD
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -h localhost -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
#UPDATE ACCESS
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -h localhost -e "FLUSH PRIVILEGES;"
#STOP SERVER
mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" -h localhost shutdown
#WILL START MARIADB
exec mysqld_safe
