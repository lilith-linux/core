#!/usr/bin/env sh
set -e

NAME="make"
DEPENDS=""
BUILD_DEPENDS="gcc"
DESC="A GNU tool for controlling the generation of executables and other non-source files of a program from the program's source files"
LICENSE="GPL-3.0-or-later AND LGPL-2.1-or-later AND GFDL-1.3-or-later AND FSFULLR"
VERSION="4.4.1"
SOURCE="https://github.com/mirror/make/archive/refs/tags/4.4.1.tar.gz"
IS_BUILD="false"

build() {
  tar -xf "$SOURCE_FILE" -C "$BUILD_DIR"

  cd "$BUILD_DIR/make-${VERSION}" && 
    mkdir -p "$PACKAGE_DIR/usr" && 
    git clone https://github.com/coreutils/gnulib
    ./bootstrap &&
    ./configure --prefix="$PACKAGE_DIR/usr" &&
    ./build.sh
}

package() {
  cd "$BUILD_DIR/make-${VERSION}" &&
    ./make install 
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
