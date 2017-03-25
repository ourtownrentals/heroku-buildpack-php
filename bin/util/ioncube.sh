#!/usr/bin/env bash

install_ioncube_ext() {
  php_ext_dir=$(php-config --extension-dir)
  echo $php_ext_dir
  curl -o ioncube.tar.gz "https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz"
  tar -xzf ioncube.tar.gz
  cp -p ioncube/ioncube_loader_lin_5.6.so $php_ext_dir
  rm -rf ioncube ioncube.tar.gz
  ln -s $php_ext_dir/ioncube_loader_lin_5.6.so $php_ext_dir/ioncube.so
}
