#!/usr/bin/env bash

install_ioncube_ext() {
  php_ext_dir="$build_dir/.heroku/php/usr/lib/php/modules"
  curl -o ioncube.tar.gz "https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz"
  tar -xzf ioncube.tar.gz
  cp -p ioncube_loader_lin_5.6.so $php_ext_dir
  ln -s $php_ext_dir/ioncube_loader_lin_5.6.so $php_ext_dir/ioncube.so
}
