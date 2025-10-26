#!/usr/bin/env sh
set -e

NAME="base"
DEPENDS=""
BUILD_DEPENDS=""
DESC="Base filesystem for lilith linux"
LICENSE="BSD-3-Clause License"
VERSION="1.0.0"
SOURCE="https://github.com/lilith-linux/base/archive/refs/tags/1.0.0.tar.gz"
IS_BUILD="false"

build() {
  tar -xf "$SOURCE_FILE" -C "$BUILD_DIR"

  cd "$BUILD_DIR/base-${VERSION}" && 
    find . -name ".gitkeep" | xargs rm -f
}

package() {
  cd "$BUILD_DIR/base-${VERSION}" &&
    cp * "$PACKAGE_DIR" -r
}

pre_inst() {
  :
}

post_inst() {
  ln -s /usr/lib/libc.so /usr/lib/ld-musl-x86_64.so.1 &&
  ln -s /usr/lib/ld-musl-x86_64.so.1 /usr/bin/ldd
}

pre_rm() {
  :
}

post_rm() {
  :
}
