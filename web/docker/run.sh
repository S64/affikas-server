#!/bin/bash
pushd /opt/wordpress

if ! $(wp core is-installed --allow-root); then
  source /opt/wp-cli.sh
fi

touch /opt/wp_debug.log
touch /usr/local/nginx/logs/error.log
touch /usr/local/nginx/logs/access.log

supervisord

popd
