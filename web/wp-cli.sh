#!/bin/bash
update-alternatives --set php $(which php5)
pushd /opt/wordpress

cat /etc/hosts
sleep 10

wp core download --allow-root --locale=ja --path="/opt/wordpress"
wp core config --allow-root --dbname='wordpress' --dbuser='root' --dbhost='mysql:3306' --locale=ja

cat /opt/wordpress/wp-config.php
sleep 10

#define('DB_HOST', getenv('MYSQL_PORT_3306_TCP_ADDR').':'.getenv('MYSQL_PORT_3306_TCP_PORT'));

popd
update-alternatives --set php $(which hhvm)
