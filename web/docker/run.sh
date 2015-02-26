#!/bin/bash
pushd /opt/wordpress

if ! $(wp core is-installed --allow-root); then
  source /opt/wp-cli.sh
fi

supervisord

popd
