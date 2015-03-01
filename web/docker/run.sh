#!/bin/bash
pushd /opt/wordpress

if ! $(wp core is-installed --allow-root); then
  source /opt/wp-cli_install.sh
fi
if true ; then
  source /opt/wp-cli_check.sh
fi

#supervisord

popd
