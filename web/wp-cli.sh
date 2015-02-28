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

wp core install --allow-root --url='157.7.239.53' --title='WordPress on Affikas' --admin_user='root' --admin_password='password' --admin_email='example@example.com'

wp plugin install --allow-root wp-multibyte-patch --activate
wp plugin install --allow-root jetpack --activate
wp plugin install --allow-root akismet
wp plugin install --allow-root twitter
wp plugin install --allow-root facebook
wp plugin install --allow-root slack
wp plugin install --allow-root google-sitemap-generator --activate
wp plugin install --allow-root pushpress --activate
wp plugin install --allow-root shortcoder --activate
wp plugin install --allow-root video-thumbnails --activate
wp plugin install --allow-root backwpup --activate
wp plugin install --allow-root broken-link-checker --activate
wp plugin install --allow-root wp-basic-auth
wp plugin install --allow-root wordfence --activate
#wp plugin install --allow-root crazy-bone --activate

wp theme install --allow-root twentyten
wp theme install --allow-root twentyeleven
wp theme install --allow-root twentytwelve
wp theme install --allow-root twentythirteen
wp theme install --allow-root twentyfourteen
wp theme install --allow-root twentyfifteen
wp theme install --allow-root wp-jurist

wp theme activate --allow-root twentyfifteen 

wp db optimize --allow-root

#define('DB_HOST', getenv('MYSQL_PORT_3306_TCP_ADDR').':'.getenv('MYSQL_PORT_3306_TCP_PORT'));

popd
update-alternatives --set php $(which hhvm)
