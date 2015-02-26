#!/bin/bash
update-alternatives --set php $(which php5)
pushd /opt/wordpress

wp core download --allow-root --locale=ja --path="/opt/wordpress"
wp core config --allow-root --dbname='wordpress' --dbuser='root' --dbhost='mysql:3306' --locale=ja

popd
update-alternatives --set php $(which hhvm)
