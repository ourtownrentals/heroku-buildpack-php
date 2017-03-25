#!/usr/bin/env bash

install_ioncube_ext() {
  curl -o ioncube.tar.gz "https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz"
  tar -xzf ioncube.tar.gz
  cp -p ioncube_loader_lin_${PHP_VERSION%.*}.so $PHP_EXT_DIR
  ln -s $PHP_EXT_DIR/ioncube_loader_lin_${PHP_VERSION%.*}.so $PHP_EXT_DIR/ioncube.so
}
