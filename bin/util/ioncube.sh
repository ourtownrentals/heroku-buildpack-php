#!/usr/bin/env bash

install_ioncube_ext() {
  php_ver=$(php -v | grep -m 1 -o -P "\\d+.\\d+\.\\d+" | awk -F \. {'print $1 "." $2'})
  php_ext_dir=$(php-config --extension-dir)
  ioncube_url="https://github.com/ourtownrentals/heroku-buildpack-php/releases/download/ioncube/ioncube_loaders_lin_x86-64.tar.gz"
  curl -s -L -o ioncube.tar.gz $ioncube_url
  tar -xzf ioncube.tar.gz
  cp -p "ioncube/ioncube_loader_lin_${php_ver}.so" $php_ext_dir
  rm -rf ioncube ioncube.tar.gz
  ln -s "${php_ext_dir}/ioncube_loader_lin_${php_ver}.so" $php_ext_dir/ioncube.so
  echo "zend_extension=ioncube.so" \
    > $build_dir/.heroku/php/etc/php/conf.d/000-ext-ioncube.ini
}
