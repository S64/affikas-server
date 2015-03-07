#!/bin/bash
update-alternatives --set php $(which php5)
pushd /opt/wordpress

wp core download --allow-root --locale=ja --path="/opt/wordpress"
wp core config --allow-root --dbname='wordpress' --dbuser='wordpress' --dbpass='wordpress' --dbhost='mysql:3306' --locale=ja --extra-php <<PHP
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_DISPLAY', false);
define( 'WP_DEBUG_LOG', true );
ini_set( 'log_errors', 1 );
ini_set( 'error_log', '/opt/wp_debug.log' );
PHP

wp core install --allow-root --url='affikas.comugi.co' --title='WordPress on Affikas' --admin_user='root' --admin_password='password' --admin_email='example@example.com'

cp /opt/composer.json.copyme /opt/wordpress/composer.json
composer install
composer update

popd
update-alternatives --set php $(which hhvm)
