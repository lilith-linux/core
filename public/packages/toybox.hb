#!/usr/bin/env sh


NAME="toybox"
DEPENDS=""
BUILD_DEPENDS="gcc"
DESC="Toybox combines many common Linux command line utilities together into a single BSD-licensed executable."
LICENSE="0BSD"
VERSION="0.8.13"
SOURCE="https://github.com/landley/toybox/archive/refs/tags/${VERSION}.tar.gz"
IS_BUILD="false"

build() {
  tar -xvf "$SOURCE_FILE" -C "$BUILD_DIR"
    cd "$BUILD_DIR/toybox-${VERSION}" &&
    LDFLAGS="-static" make defconfig &&
    LDFLAGS="-static" make -j$(nproc)
}

package() {
  cd "$BUILD_DIR/toybox-${VERSION}" && 
    mkdir -p "${PACKAGE_DIR}/usr/bin" &&
    PREFIX="${PACKAGE_DIR}/" make install &&
    ls 
}

pre_inst() {
  :
}

post_inst() {
  :
}

pre_rm() {
  :
}

post_rm() {
  :
}
