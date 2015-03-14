#!/bin/bash
update-alternatives --set php $(which php5)
pushd /opt/wordpress

wp plugin install --allow-root wp-multibyte-patch --activate
wp plugin install --allow-root jetpack --activate
wp plugin install --allow-root google-sitemap-generator --activate
wp plugin install --allow-root pushpress --activate
wp plugin install --allow-root wpmandrill --activate
wp plugin install --allow-root theme-check --activate

wp plugin activate --allow-root github-updater --activate

wp plugin install --allow-root akismet
wp plugin install --allow-root twitter
wp plugin install --allow-root facebook
wp plugin install --allow-root slack
wp plugin install --allow-root shortcoder
wp plugin install --allow-root video-thumbnails
wp plugin install --allow-root backwpup
wp plugin install --allow-root broken-link-checker
wp plugin install --allow-root wp-basic-auth
wp plugin install --allow-root wordfence
#wp plugin install --allow-root crazy-bone --activate
#wp plugin install --allow-root revisr
#wp plugin install --allow-root gitium
#wp plugin install --allow-root wordless

wp theme install --allow-root twentyten
wp theme install --allow-root twentyeleven
wp theme install --allow-root twentytwelve
wp theme install --allow-root twentythirteen
wp theme install --allow-root twentyfourteen
wp theme install --allow-root twentyfifteen

wp theme install --allow-root wp-jurist
wp theme install --allow-root hueman
wp theme install --allow-root flower

#wp theme activate --allow-root twentyfifteen

wp db optimize --allow-root

popd
update-alternatives --set php $(which hhvm)
